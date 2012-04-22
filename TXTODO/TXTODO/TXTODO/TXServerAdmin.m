#import "TXServerAdmin.h"
#import "TXComputer.h"

@implementation TXServerAdmin
@synthesize computers = _computers;
@synthesize adminId = _adminId;
@synthesize privilegeLevel;

- (void)setupComputers:(NSArray *)computers {
    for (TXComputer *c in self.computers) {
        NSLog(@"before turning on: %d", c.poweredOn);
        [c turnOn];
        NSLog(@"after turning on: %d", c.poweredOn);        
    }
}

- (void)setupComputers {
    [self setupComputers:self.computers];
}

- (NSInteger)adminId {
    return _adminId;
}

- (id)commonInit {
    self = [super init];
    if (self) {
        //do standard setup here
    }
    return self;
}

- (id)initWithComputers:(NSMutableArray *)computers {
    self = [self commonInit];
    if (self) {
        //do something with computers
        self.computers = computers;
        [self setupComputers];
    }
    
    return self;
}

- (id)initWithMotherboards:(NSMutableArray *)motherboards {
    self = [self commonInit];
    if (self) {
        //do something with motherboards
        [motherboards removeObjectAtIndex:0];
    }
    return self;
}

- (void)test {
    TXServerAdmin *admin = [[TXServerAdmin alloc] init];
    NSArray *computers = [NSArray array];
    [admin setupComputers:computers];
    [admin release];
}

- (void)dealloc {
    [_name release];
    [_computers release];
    [super dealloc];    
}










@end
