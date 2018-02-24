import 'dart:async';

import 'package:flutter/services.dart';
import 'package:platform/platform.dart';

class FlutterStoreReview {
  static const MethodChannel _channel =
      const MethodChannel('flutter_store_review');

  static Future<Null> requestReview() {
      Platform platform = new LocalPlatform();
      if (!platform.isIOS)
        throw UnsupportedError;
    return _channel.invokeMethod('requestReview');
  }
}
