#import <UIKit/UIKit.h>
#import "TXUser.h"

@interface TXServerAdmin : NSObject <TXAdministrator> {
    NSString *_name;
}

@property (nonatomic, retain) NSMutableArray *computers;
@property (nonatomic, readonly) NSInteger adminId;
@property (nonatomic, assign) NSInteger privilegeLevel;

- (void)setupComputers;

- (id)initWithComputers:(NSArray *)computers;

@end