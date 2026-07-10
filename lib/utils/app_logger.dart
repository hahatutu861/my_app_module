import 'package:flutter/foundation.dart';

class AppLogger {
  static bool _enabled = false;

  static void init(bool enabled) {
    _enabled = enabled;
  }

  static void d(String message) {
    if (_enabled) {
      debugPrint('[DEBUG] $message');
    }
  }

  static void i(String message) {
    if (_enabled) {
      debugPrint('[INFO] $message');
    }
  }

  static void e(String message) {
    if (_enabled) {
      debugPrint('[ERROR] $message');
    }
  }
}
