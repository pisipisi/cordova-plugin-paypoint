#import <Cordova/CDV.h>
#import <iDock/ETPPiDock.h>
//#import "iDock.framework/Headers/ETPPiDock.h"
@interface PaypointIonic : CDVPlugin {
  // Member variables go here.
}
- (void)openDraw:(CDVInvokedUrlCommand*)command;
- (void)isPayPointConnected: (CDVInvokedUrlCommand*)command;
- (BOOL)cashDrawerStatusDidChange:(CDVInvokedUrlCommand*)command;
@end