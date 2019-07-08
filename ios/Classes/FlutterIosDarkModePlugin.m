#import "FlutterIosDarkModePlugin.h"
#import <flutter_ios_dark_mode/flutter_ios_dark_mode-Swift.h>

@implementation FlutterIosDarkModePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterIosDarkModePlugin registerWithRegistrar:registrar];
}
@end
