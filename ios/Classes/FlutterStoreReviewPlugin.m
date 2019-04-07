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
      BOOL res = [self requestView];
      result(@(res));
  }
  else if ([@"requestReviewLater" isEqualToString:call.method]) {
      NSNumber *seconds = call.arguments[@"seconds"];
      dispatch_after(dispatch_time(DISPATCH_TIME_NOW, seconds.intValue * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
          [self requestView];
      });
      result(@YES);
  }
  else
    result(FlutterMethodNotImplemented);
}
    
- (BOOL)requestView {
    if (@available(iOS 10.3, *)) {
        [SKStoreReviewController requestReview];
        return YES;
    }
    else
        return NO;
}

@end
