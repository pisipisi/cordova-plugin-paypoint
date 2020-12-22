/********* PaypointIonic.m Cordova Plugin Implementation *******/

#import "PaypointIonic.h"

@implementation PaypointIonic

- (void)openDraw:(CDVInvokedUrlCommand*)command 
{
    [[ETPPiDockControl hardwareInstance] openDrawerWithCompletionHandler:^(BOOL didOpen) {
        CDVPluginResult* result = [CDVPluginResult
                                       resultWithStatus: CDVCommandStatus_OK
                                       messageAsBool:didOpen
                                       ];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }];
}

- (void)cashDrawStatus:(CDVInvokedUrlCommand*) command
{
    CDVPluginResult* result = [CDVPluginResult
                                   resultWithStatus: CDVCommandStatus_OK
                                   messageAsBool:[[ETPPiDockControl hardwareInstance] checkCashDrawerStatus]
                                   ];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

- (void)printSync:(CDVInvokedUrlCommand*) command
{
    NSString* printString = [command.arguments objectAtIndex:0];
    [[ETPPiDockControl hardwareInstance] printSync:printString];
    CDVPluginResult* result = [CDVPluginResult
                                   resultWithStatus: CDVCommandStatus_OK
                                   messageAsString:@"Printed"
                                   ];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}


- (void)startDisplayCFDLine:(CDVInvokedUrlCommand*) command
{
    NSString* display1 = [command.arguments objectAtIndex:0];
    NSString* display2 = [command.arguments objectAtIndex:1];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:display1,@"1", display2, @"2", nil];
    [[ETPPiDockControl hardwareInstance] startDisplayCFDLineSync:dictionary];
    CDVPluginResult* result = [CDVPluginResult
                                   resultWithStatus: CDVCommandStatus_OK
                                   messageAsString:@"Successed"
                                   ];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

- (void)setCustomerDisplayBacklineOnOff:(CDVInvokedUrlCommand*) command
{
    BOOL onOff = [command.arguments objectAtIndex:0];
    [[ETPPiDockControl hardwareInstance] setCustomerDisplayBacklineOn:onOff];
    CDVPluginResult* result = [CDVPluginResult
                                   resultWithStatus: CDVCommandStatus_OK
                                   messageAsString:@"Successed"
                                   ];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

- (void)customerDisplayStopScroll:(CDVInvokedUrlCommand*) command
{
    [[ETPPiDockControl hardwareInstance] customerDisplayStopScroll];
    CDVPluginResult* result = [CDVPluginResult
                                   resultWithStatus: CDVCommandStatus_OK
                                   messageAsString:@"Successed"
                                   ];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

- (void)customerDisplayClearText:(CDVInvokedUrlCommand*) command
{
    [[ETPPiDockControl hardwareInstance] customerDisplayClearText];
    CDVPluginResult* result = [CDVPluginResult
                                   resultWithStatus: CDVCommandStatus_OK
                                   messageAsString:@"Successed"
                                   ];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}


- (void)customerDisplayDecreaseLeftScrollSpeed:(CDVInvokedUrlCommand*) command
{
    [[ETPPiDockControl hardwareInstance] customerDisplayDecreaseLeftScrollSpeed];
    CDVPluginResult* result = [CDVPluginResult
                                   resultWithStatus: CDVCommandStatus_OK
                                   messageAsString:@"Successed"
                                   ];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

- (void)customerDisplayIncreaseLeftScrollSpeed:(CDVInvokedUrlCommand*) command
{
    [[ETPPiDockControl hardwareInstance] customerDisplayIncreaseLeftScrollSpeed];
    CDVPluginResult* result = [CDVPluginResult
                                   resultWithStatus: CDVCommandStatus_OK
                                   messageAsString:@"Successed"
                                   ];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

- (void)customerDisplayDecreaseRightScrollSpeed:(CDVInvokedUrlCommand*) command
{
    [[ETPPiDockControl hardwareInstance] customerDisplayDecreaseRightScrollSpeed];
    CDVPluginResult* result = [CDVPluginResult
                                   resultWithStatus: CDVCommandStatus_OK
                                   messageAsString:@"Successed"
                                   ];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

- (void)customerDisplayIncreaseRightScrollSpeed:(CDVInvokedUrlCommand*) command
{
    [[ETPPiDockControl hardwareInstance] customerDisplayIncreaseRightScrollSpeed];
    CDVPluginResult* result = [CDVPluginResult
                                   resultWithStatus: CDVCommandStatus_OK
                                   messageAsString:@"Successed"
                                   ];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

- (void)setBarCodeReaderOnOff:(CDVInvokedUrlCommand*) command
{
    BOOL onOff = [command.arguments objectAtIndex:0];
    [[ETPPiDockControl hardwareInstance] setBarcodeReaderOn:onOff];
    CDVPluginResult* result = [CDVPluginResult
                                   resultWithStatus: CDVCommandStatus_OK
                                   messageAsBool:[[ETPPiDockControl hardwareInstance] isBarcodeReaderOn]
                                   ];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}


- (void)readBarCode:(CDVInvokedUrlCommand*) command
{
    [[ETPPiDockControl hardwareInstance] clearMSR];
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
    [center addObserverForName:IDBarcodeReaderReadDataNotification object:nil
        queue:mainQueue usingBlock:^(NSNotification *notification) {
        [self didReadBarCodeData : notification withCommand: command];
    }];

    CDVPluginResult* result = [CDVPluginResult
                                   resultWithStatus: CDVCommandStatus_OK
                                   messageAsString:@"Successed"
                                   ];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}



- (void)didReadBarCodeData:(NSNotification*)notification withCommand: (CDVInvokedUrlCommand*) command  {
    
    NSDictionary *data = notification.userInfo;
    CDVPluginResult* result = [CDVPluginResult
                                       resultWithStatus: CDVCommandStatus_OK
                                       messageAsDictionary:data
                                       ];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

- (void)clearMSR:(CDVInvokedUrlCommand*) command
{
    [[ETPPiDockControl hardwareInstance] clearMSR];
    CDVPluginResult* result = [CDVPluginResult
                                   resultWithStatus: CDVCommandStatus_OK
                                   messageAsString:@"Successed"
                                   ];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

- (void)readMSR:(CDVInvokedUrlCommand*) command
{
    [[ETPPiDockControl hardwareInstance] clearMSR];
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
    [center addObserverForName:IDMagneticStripeReaderReadDataNotification object:nil
        queue:mainQueue usingBlock:^(NSNotification *notification) {
        [self didReadMSRData : notification withCommand: command];
    }];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didReceiveObjectFromNotification: command:) name:IDMagneticStripeReaderReadDataNotification object:nil];
    CDVPluginResult* result = [CDVPluginResult
                                   resultWithStatus: CDVCommandStatus_OK
                                   messageAsString:@"Successed"
                                   ];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

- (void)didReadMSRData:(NSNotification*)notification withCommand: (CDVInvokedUrlCommand*) command  {
    
    NSDictionary *data = notification.userInfo;
    
   
        CDVPluginResult* result = [CDVPluginResult
                                       resultWithStatus: CDVCommandStatus_OK
                                       messageAsDictionary:data
                                       ];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
        // Set count label
//        NSMutableString *msrData = [[NSMutableString alloc]init];
//        NSString *result = [NSString stringWithFormat:@"%@",data[IDOCK_MSR_DATA]];
//        [msrData appendString:result];
//        [msrData appendString:@"\r\r"];
//        [msrData appendString:@"Total MSR Length: "];
//        NSString *leng = [NSString stringWithFormat:@"%lu",(unsigned long)[result length]];
//        [msrData appendString:leng];
//
//     //   _msrRowData = msrData;
//
//        // Set msrTextField
//        NSMutableString *msrField = [[NSMutableString alloc]init];
//
//        NSString *track1 = [NSString stringWithFormat:@"%@",data[IDOCK_MSR_DATA_TRACK_1]];
//        NSString *track2 = [NSString stringWithFormat:@"%@",data[IDOCK_MSR_DATA_TRACK_2]];
//        NSString *track3 = [NSString stringWithFormat:@"%@",data[IDOCK_MSR_DATA_TRACK_3]];
//        NSString *dukptSerial = [NSString stringWithFormat:@"%@",data[IDOCK_MSR_DATA_DUKPT_SERIAL_NUMBER]];
//        NSString *deviceSerial = [NSString stringWithFormat:@"%@",data[IDOCK_MSR_DATA_DEVICE_SERIAL_NUMBER]];
//        NSString *magnePrintStatus = [NSString stringWithFormat:@"%@",data[IDOCK_MSR_DATA_MAGNE_PRINT_STATUS]];
//        NSString *encryptedMagnePrintData = [NSString stringWithFormat:@"%@",data[IDOCK_MSR_DATA_ENCRYPTED_MAGNE_PRINT_DATA]];
//        NSString *iin = [NSString stringWithFormat:@"%@",data[IDOCK_MSR_DATA_IIN]];
//        NSString *lastfour = [NSString stringWithFormat:@"%@",data[IDOCK_MSR_DATA_LASTFOUR]];
//        NSString *name = [NSString stringWithFormat:@"%@",data[IDOCK_MSR_DATA_NAME]];
//
//        [msrField appendString:@"Track1: "];
//        [msrField appendString:track1];
//        [msrField appendString:@"\r"];
//
//        [msrField appendString:@"Track2: "];
//        [msrField appendString:track2];
//        [msrField appendString:@"\r"];
//
//        [msrField appendString:@"Track3: "];
//        [msrField appendString:track3];
//        [msrField appendString:@"\r"];
//
//        [msrField appendString:@"Dukpt Serial Number: "];
//        [msrField appendString:dukptSerial];
//        [msrField appendString:@"\r"];
//
//        [msrField appendString:@"Device Serial Number: "];
//        [msrField appendString:deviceSerial];
//        [msrField appendString:@"\r"];
//
//        [msrField appendString:@"Magne Print Status: "];
//        [msrField appendString:magnePrintStatus];
//        [msrField appendString:@"\r"];
//
//        [msrField appendString:@"Encrypted Magne Print Data: "];
//        [msrField appendString:encryptedMagnePrintData];
//        [msrField appendString:@"\r"];
//
//        [msrField appendString:@"IIN: "];
//        [msrField appendString:iin];
//        [msrField appendString:@"\r"];
//
//        [msrField appendString:@"Last Four number: "];
//        [msrField appendString:lastfour];
//        [msrField appendString:@"\r"];
//
//        [msrField appendString:@"Name: "];
//        [msrField appendString:name];
//        [msrField appendString:@"\r"];
//
//        _msrDetialsData = msrField;
//
//        dispatch_async(dispatch_get_main_queue(), ^{
//
//            self.msrDataTextView.text = self.viewStatus ? _msrDetialsData : _msrRowData;
//
//        });
//
    //} else {
        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self showErrorAlert];
//        });
 //   }
}

- (void)isPayPointConnected: (CDVInvokedUrlCommand*)command {
    CDVPluginResult *pluginResult = nil;
    if([[ETPPiDockControl hardwareInstance] isConnected]) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString: @"Connected"];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Not connected"];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
};

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
