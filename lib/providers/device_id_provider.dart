import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app_module/shared/bridges/pigeon_generated.dart';

final deviceIdProvider = FutureProvider<String>((ref) async {
  return NativeApi().getDeviceId();
});
