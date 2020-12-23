
#import <Foundation/Foundation.h>

enum IDockHWVersion
{
    HW_Unknown,
    HW_V1,
    HW_V2
};

#define HWVersionNitification @"HWVersion"

@interface HWVersion : NSObject

+ (enum IDockHWVersion) getVersion;

+ (void) setVersion:(enum IDockHWVersion) version;

@end