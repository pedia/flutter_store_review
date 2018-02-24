#import <StoreKit/StoreKit.h>
#import "FlutterStoreReviewPlugin.h"

@implementation FlutterStoreReviewPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_store_review"
            binaryMessenger:[registrar messenger]];
  FlutterStoreReviewPlugin* instance = [[FlutterStoreReviewPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"requestReview" isEqualToString:call.method]) {
    [SKStoreReviewController requestReview];
    result(nil);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
