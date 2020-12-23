
#import "HWVersion.h"

static enum IDockHWVersion hwVer;

@implementation HWVersion

+ (enum IDockHWVersion) getVersion
{
    return hwVer;
}

+ (void) setVersion:(enum IDockHWVersion) version
{
    hwVer = version;
}

@end
