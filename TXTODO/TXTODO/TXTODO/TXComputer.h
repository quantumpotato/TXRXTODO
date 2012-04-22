#import <UIKit/UIKit.h>

@interface TXComputer : NSObject

@property (nonatomic, readonly) BOOL poweredOn;

- (void)turnOn;
- (void)turnOff;
- (void)flipPowerSwitch;

@end