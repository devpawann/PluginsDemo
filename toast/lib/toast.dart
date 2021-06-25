import 'dart:async';

import 'package:flutter/services.dart';

class Toast {
  static const MethodChannel _channel = const MethodChannel('toast');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<void> showToast(String message) async {
    Map<String, dynamic> args = {};
    args.putIfAbsent("msg", () => message);
    await _channel.invokeMethod("showToast", args);
  }
}
