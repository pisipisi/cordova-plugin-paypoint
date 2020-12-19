/********* PaypointIonic.m Cordova Plugin Implementation *******/

#import "PaypointIonic.h"

@implementation PaypointIonic

- (BOOL)openDraw:(CDVInvokedUrlCommand*)command 
{
    [ETPPiDockControl hardwareInstance].openCashDrawerCompletionHandler = ^(BOOL didOpen) {
        CDVPluginResult* result = [CDVPluginResult
                                       resultWithStatus: CDVCommandStatus_OK
                                       messageAsBool:didOpen
                                       ];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    };
}
- (BOOL)cashDrawerStatusDidChange:(CDVInvokedUrlCommand*)command 
{
	if ([[ETPPiDockControl hardwareInstance] checkCashDrawerStatus]) {
        return YES;//Cash drawer is open
	} else {
        return NO;//Cash drawer is closed
   	 }
}

- (void)checkPaperStatus:(CDVInvokedUrlCommand*)command 
{
        [[ETPPiDockControl hardwareInstance] checkPaperStatusWithCompletionHandler:^(BOOL paperBinIsEmpty) {
        if (paperBinIsEmpty) {

        } else {

        }
    }];
}


// - (void)coolMethod:(CDVInvokedUrlCommand*)command
// {
//     CDVPluginResult* pluginResult = nil;
//     NSString* echo = [command.arguments objectAtIndex:0];

//     if (echo != nil && [echo length] > 0) {
//         pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
//     } else {
//         pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
//     }

//     [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
// }

- (void)pluginInitialize
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(finishLaunching:) name:UIApplicationDidFinishLaunchingNotification object:nil];

}

- (void)finishLaunching:(NSNotification *)notification
{
    [[ETPPiDockControl hardwareInstance] establishFirmwareConnection];
}

@end
