//
//  ViewController.m
//  BuggyProject
//  Copyright (c) 2014 oDesk Corporation. All rights reserved.
//

#import "ViewController.h"
#import "SomeClass.h"
#import "CoreDataHelpers.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)firstBug:(id)sender {
	[SomeClass printTextInMain:@"Bug 1"];
}

- (IBAction)secondBug:(id)sender {
    __block NSInteger x = 123;
	void (^printX)() = ^() {
		NSLog(@"%i", x);
	};
	x++;
	printX();
}

- (IBAction)thirdBug:(id)sender {
	[CoreDataHelpers fillUnsortedData];
	NSArray *models = [CoreDataHelpers arrayForFetchRequestWithName:@"AllModels"];
	NSLog(@"thirdbug%@", models);
}

- (IBAction)fourthBug:(id)sender {
	/*static NSInteger count = 1;
     if (count>1) {
     [CoreDataHelpers cleanData];
     }
     
     [CoreDataHelpers fillUnsortedData];
     NSArray *models = [CoreDataHelpers arrayForFetchRequestWithName:@"AllModels"];
     NSLog(@"%@", models);
     count++;
     */
    NSArray *models = [CoreDataHelpers arrayForFetchRequestWithName:@"AllModels"];
    
	if (models.count > 0) {
		[CoreDataHelpers cleanData];
	}
	
	[CoreDataHelpers fillUnsortedData];
	models = [CoreDataHelpers arrayForFetchRequestWithName:@"AllModels"];
	NSLog(@"%@", models);
}

- (IBAction)fifthBug:(id)sender {
	/*[CoreDataHelpers fillUnsortedData];
     NSArray *models = [CoreDataHelpers arrayForFetchRequestWithName:@"AllModels"];
     NSLog(@"%@", models);
     */
    [CoreDataHelpers fillUnsortedData];
	NSArray *models = [CoreDataHelpers arrayForFetchRequestWithName:@"AllModels"];
    
    NSSortDescriptor *sortByOwnerName = [[NSSortDescriptor alloc] initWithKey:@"owner.ownerName"
                                                                    ascending:YES];
    NSSortDescriptor *sortByModelName = [[NSSortDescriptor alloc] initWithKey:@"modelName"
                                                                    ascending:YES];
    
    NSMutableArray *sortedResults = [NSMutableArray arrayWithArray:models];
    [sortedResults sortUsingDescriptors:@[sortByModelName, sortByOwnerName]];
   	NSLog(@"%@", models);
}

@end
