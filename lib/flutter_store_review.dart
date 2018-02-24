import 'dart:async';

import 'package:flutter/services.dart';

class FlutterStoreReview {
  static const MethodChannel _channel =
      const MethodChannel('flutter_store_review');

  static Future<String> get platformVersion =>
      _channel.invokeMethod('getPlatformVersion');
}
