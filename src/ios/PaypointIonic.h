#import <Cordova/CDV.h>
#import <iDock/ETPPiDock.h>
#import <AudioToolbox/AudioToolbox.h>
//#import "iDock.framework/Headers/ETPPiDock.h"
@interface PaypointIonic : CDVPlugin {
  // Member variables go here.
}
- (void)openDraw:(CDVInvokedUrlCommand*)command;
- (void)cashDrawStatus:(CDVInvokedUrlCommand*) command;
- (void)printSync:(CDVInvokedUrlCommand*) command;
- (void)startDisplayCFDLine:(CDVInvokedUrlCommand*) command;
- (void)setCustomerDisplayBacklightOnOff:(CDVInvokedUrlCommand*) command;
- (void)customerDisplayStopScroll:(CDVInvokedUrlCommand*) command;
- (void)customerDisplayClearText:(CDVInvokedUrlCommand*) command;
- (void)customerDisplayDecreaseLeftScrollSpeed:(CDVInvokedUrlCommand*) command;
- (void)customerDisplayIncreaseLeftScrollSpeed:(CDVInvokedUrlCommand*) command;
- (void)customerDisplayDecreaseRightScrollSpeed:(CDVInvokedUrlCommand*) command;
- (void)customerDisplayIncreaseRightScrollSpeed:(CDVInvokedUrlCommand*) command;
- (void)setBarCodeReaderOnOff:(CDVInvokedUrlCommand*) command;
- (void)readBarCode:(CDVInvokedUrlCommand*) command;
- (void)clearMSR:(CDVInvokedUrlCommand*) command;
- (void)readMSR:(CDVInvokedUrlCommand*) command;
- (void)checkPaperStatus:(CDVInvokedUrlCommand*)command;
- (void)isPayPointConnected: (CDVInvokedUrlCommand*)command;
- (void)hardwareVersion:(CDVInvokedUrlCommand*)command;
@end