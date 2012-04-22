#import "TXComputer.h"

@implementation TXComputer
@synthesize poweredOn = _poweredOn;

- (void)turnOn {
    _poweredOn = YES;
}

- (void)turnOff {
    _poweredOn = NO;
}

- (void)flipPowerSwitch {
    _poweredOn = !_poweredOn;
}

@end
