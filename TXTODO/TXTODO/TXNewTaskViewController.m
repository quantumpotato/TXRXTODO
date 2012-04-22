#import "TXNewTaskViewController.h"

@interface TXNewTaskViewController ()

@end

@implementation TXNewTaskViewController
@synthesize entryField = _entryField;
@synthesize delegate = _delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)saveButtonTapped {
    NSString *task = self.entryField.text;
    [self.delegate taskCreated:task];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *saveButton = [[[UIBarButtonItem alloc] initWithTitle:@"Save"
                                                                    style:UIBarButtonItemStylePlain 
                                                                   target:self 
                                                                   action:@selector(saveButtonTapped)] autorelease];
    self.navigationItem.rightBarButtonItem = saveButton;
}


- (void)dealloc {
    self.delegate = nil;
    [super dealloc];
}

@end
