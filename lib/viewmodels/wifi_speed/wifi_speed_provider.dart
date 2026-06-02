import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app_module/shared/bridges/pigeon_generated.dart';
import 'package:my_app_module/viewmodels/wifi_speed/wifi_speed_state.dart';

final wifiSpeedViewModelProvider =
    NotifierProvider<WifiSpeedViewModel, WifiSpeedState>(
  WifiSpeedViewModel.new,
);

class WifiSpeedViewModel extends Notifier<WifiSpeedState> {
  @override
  WifiSpeedState build() {
    ref.onDispose(() {
      _cleanup();
    });
    return const WifiSpeedState();
  }

  void _cleanup() {
    NativeFlutterApi.setUp(null);
    NativeApi().stopWifiSpeedTest();
  }

  Future<void> startSpeedTest() async {
    state = state.copyWith(isTesting: true, errorMessage: null);
    NativeFlutterApi.setUp(_WifiSpeedCallback(
      onSpeedUpdated: (result) {
        state = WifiSpeedState(
          isTesting: false,
          speed: result.speed,
          isSuccess: result.isSuccess,
          errorMessage: result.errorMessage,
        );
      },
    ));
    try {
      await NativeApi().startWifiSpeedTest();
    } catch (e) {
      state = WifiSpeedState(
        isTesting: false,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> stopSpeedTest() async {
    try {
      await NativeApi().stopWifiSpeedTest();
    } finally {
      state = state.copyWith(isTesting: false);
    }
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
