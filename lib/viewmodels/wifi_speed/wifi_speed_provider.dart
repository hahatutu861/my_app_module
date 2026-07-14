import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app_module/models/speed_test_record.dart';
import 'package:my_app_module/providers/app_runtime_config.dart';
import 'package:my_app_module/shared/bridges/pigeon_generated.dart';
import 'package:my_app_module/viewmodels/floor/floor_viewmodel_provider.dart';
import 'package:my_app_module/viewmodels/wifi_speed/wifi_speed_state.dart';

final wifiSpeedViewModelProvider =
    NotifierProvider<WifiSpeedViewModel, WifiSpeedState>(
  WifiSpeedViewModel.new,
);

/// 当前连接 WiFi 的链路信息（频段 / 信道 / 信号强度）
/// 反映手机实时连接状态，随房间栏展示时拉取，隐藏后自动释放
final wifiConnectionInfoProvider =
    FutureProvider.autoDispose<WifiConnectionInfo?>((ref) async {
  return NativeApi().getCurrentWifiConnectionInfo();
});

/// 将原生原始值拼接为展示字符串，例如 "5GHz (Ch 6, -42 dBm)"
/// 单位与格式集中在此控制，原生侧只负责采集
String formatWifiConnectionInfo(WifiConnectionInfo? info) {
  if (info == null) return '--';
  final band = (info.band ?? '').replaceAll('G', 'GHz');
  final parts = <String>[];
  if (info.channel != null) parts.add('Ch ${info.channel}');
  if (info.rssi != null) parts.add('${info.rssi} dBm');
  if (band.isEmpty && parts.isEmpty) return '--';
  final detail = parts.isEmpty ? '' : ' (${parts.join(', ')})';
  return '$band$detail';
}

enum SpeedTestAction {
  startTest,
  showWifiDialog
}

enum SegmentedBarColor { gray3, yellow6, lime6, warning6Normal }

class WifiSpeedViewModel extends Notifier<WifiSpeedState> {
  Timer? _testTimer;
  Timer? _progressTimer;

  @override
  WifiSpeedState build() {
    ref.onDispose(() {
      _cleanup();
    });
    return const WifiSpeedState();
  }

  void _cleanup() {
    _cleanupTimers();
    NativeFlutterApi.setUp(null);
    NativeApi().stopWifiSpeedTest();
  }

  Future<bool> checkWifiConnection() async {
    return NativeApi().isConnectedToDeviceWifi();
  }

  Future<void> openWifiSettings() async {
    await NativeApi().openWifiSettings();
  }

  Future<SpeedTestAction> checkAndPrepareSpeedTest() async {
    final isConnected = await checkWifiConnection();
    if (!isConnected) {
      return SpeedTestAction.showWifiDialog;
    }
    return SpeedTestAction.startTest;
  }

  Future<void> startSpeedTest() async {
    if (state.isTesting) return;

    state = state.copyWith(
      isTesting: true,
      progress: 4,
      samples: [],
      errorMessage: null,
    );

    NativeFlutterApi.setUp(_WifiSpeedCallback(
      onSpeedUpdated: (result) {
        if (result.isSuccess && result.speed >= 0) {
          final newSamples = [...state.samples, result.speed];
          state = state.copyWith(samples: newSamples);
        }
      },
    ));

    try {
      await NativeApi().startWifiSpeedTest();
      _progressTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (state.progress > 1) {
          state = state.copyWith(progress: state.progress - 1);
        } else {
          state = state.copyWith(progress: 0);
          timer.cancel();
        }
      });
      _testTimer = Timer(const Duration(seconds: 5), () async {
        await _finishSpeedTest();
      });
    } catch (e) {
      state = state.copyWith(
        isTesting: false,
        isSuccess: false,
        errorMessage: e.toString(),
      );
      _cleanupTimers();
    }
  }

  Future<void> stopSpeedTest() async {
    _cleanupTimers();
    NativeFlutterApi.setUp(null);
    try {
      await NativeApi().stopWifiSpeedTest();
    } finally {
      state = state.copyWith(isTesting: false);
    }
  }

  Future<void> _finishSpeedTest() async {
    _cleanupTimers();
    NativeFlutterApi.setUp(null);
    await NativeApi().stopWifiSpeedTest();
    if (state.samples.isEmpty) {
      state = state.copyWith(
        isTesting: false,
        isSuccess: true,
      );
      ref.invalidate(wifiConnectionInfoProvider);
      return;
    }
    final sortedSamples = [...state.samples]..sort();
    final medianSpeed = sortedSamples[sortedSamples.length ~/ 2];
    final wifiInfo = await NativeApi().getCurrentWifiConnectionInfo();
    final deviceName = ref.read(connectedDeviceNameProvider);
    final record = SpeedTestRecord(
      speed: medianSpeed,
      band: wifiInfo?.band,
      channel: wifiInfo?.channel,
      rssi: wifiInfo?.rssi,
      deviceName: deviceName,
      timestamp: DateTime.now(),
    );
    state = state.copyWith(
      isTesting: false,
      speed: medianSpeed,
      isSuccess: true,
    );
    await _saveRecordToRoom(record);
    ref.invalidate(wifiConnectionInfoProvider);
  }

  Future<void> _saveRecordToRoom(SpeedTestRecord record) async {
    final floorViewModel = ref.read(floorViewModelProvider.notifier);
    final selectedIndex = floorViewModel.selectedRoomIndex;
    if (selectedIndex == null) return;
    final room = floorViewModel.getRoomByIndex(selectedIndex);
    if (room == null) return;
    final updatedRoom = room.copyWith(
      records: [...room.records, record],
    );
    await floorViewModel.updateRoom(selectedIndex, updatedRoom);
  }

  void _cleanupTimers() {
    _testTimer?.cancel();
    _progressTimer?.cancel();
    _testTimer = null;
    _progressTimer = null;
  }

  static const int _segmentCount = 3;

  List<SegmentedBarColor> segmentedBarColors(WifiSpeedLevel? level) {
    final (SegmentedBarColor activeColor, int activeCount) = switch (level) {
      WifiSpeedLevel.good => (SegmentedBarColor.lime6, 3),
      WifiSpeedLevel.moderate => (SegmentedBarColor.yellow6, 2),
      WifiSpeedLevel.weak => (SegmentedBarColor.warning6Normal, 1),
      null => (SegmentedBarColor.gray3, 0),
    };
    return List.generate(
      _segmentCount,
      (index) => index < activeCount ? activeColor : SegmentedBarColor.gray3,
    );
  }
}

class _WifiSpeedCallback implements NativeFlutterApi {
  final void Function(WifiSpeedResult) onSpeedUpdated;

  _WifiSpeedCallback({required this.onSpeedUpdated});

  @override
  void onWifiSpeedUpdated(WifiSpeedResult result) {
    onSpeedUpdated(result);
  }
}
