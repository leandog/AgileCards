#import "LDTCardTableViewController.h"
#import "LDTCardDeckViewController.h"
#import "LDTUtilities.h"

@implementation LDTCardTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"LeanDog Agile Tools";
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self addCards];
    [self addDiscussionGuideButton];
}

- (void)addCards
{
    BOOL isIPhone5 = [LDTUtilities isIPhone5];
    
    NSInteger width = isIPhone5 ? 108 : 88;
    NSInteger height = isIPhone5 ? 152 : 132;
    NSInteger xLeft = 20;
    NSInteger yTop = 20;
    NSInteger xRight =  isIPhone5 ? 136 : 116;
    NSInteger yBottom = isIPhone5 ? 180 : 160;
    
    [self addButtonWithFrame:CGRectMake(xLeft, yTop, width, height) tag:0 label:@"T-Shirts" andImage:@"320TShirts.jpg"];
    [self addButtonWithFrame:CGRectMake(xRight, yTop, width, height) tag:1 label:@"Fist to 5" andImage:@"320Fistof5.jpg"];
    [self addButtonWithFrame:CGRectMake(xLeft, yBottom, width, height) tag:2 label:@"Collaboration" andImage:@"320Collaboration.jpg"];
    [self addButtonWithFrame:CGRectMake(xRight, yBottom, width, height) tag:3 label:@"Thinking Hats" andImage:@"320ThinkingHat.jpg"];
}

- (void)addButtonWithFrame:(CGRect)frame tag:(NSInteger)tag label:(NSString *)label andImage:(NSString*)imageName
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.tag = tag;
    button.backgroundColor = [UIColor clearColor];
    button.accessibilityLabel = label;
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonWasClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)addDiscussionGuideButton
{
    UIButton *discussionGuideButton = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat yCoordinate = [LDTUtilities isIPhone5] ? 374 : 286;
    discussionGuideButton.frame = CGRectMake(190, yCoordinate, 130, 130);
    [discussionGuideButton setBackgroundColor:[UIColor clearColor]];
    [discussionGuideButton addTarget:self action:@selector(discussionGuideButtonClick:)forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview:discussionGuideButton];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    imageView.image = [LDTUtilities pngNamed:@"background.png"];
}

- (IBAction)buttonWasClicked:(UIButton *)button
{
    [self navigateToViewFromSelection:button.tag];
}

- (IBAction)discussionGuideButtonClick:(UIButton *)button
{
    NSURL *url = [NSURL URLWithString:@"http://www.leandog.com/downloads/"];
    [[UIApplication sharedApplication] openURL:url];
}

- (void)navigateToViewFromSelection:(NSInteger)selection
{
    NSString *imagePrefix;
    NSInteger cardCount = 0;
    NSString *title;
    switch (selection) {
        case 0: {
            title = @"T-Shirt Sizes";
            imagePrefix = @"shirts";
            cardCount = 6;
            break;
        }
        case 1:
            title = @"Fist to 5";
            imagePrefix = @"fist";
            cardCount = 7;
            break;
        case 2:
            title = @"Collaboration 8";
            imagePrefix = @"collab";
            cardCount = 9;
            break;
        case 3:
            title = @"6 Thinking Hats";
            imagePrefix = @"hats";
            cardCount = 8;
            break;
        default:
            break;
    }
    if(imagePrefix && cardCount && title) {
        LDTCardDeckViewController *ctlr = [[LDTCardDeckViewController alloc] initWithTitle:title imagePrefix:imagePrefix andCardCount:cardCount];
        
        UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Agile Tools" style:UIBarButtonItemStylePlain target:nil action:nil];
        self.navigationItem.backBarButtonItem = backButtonItem;
        [self.navigationController pushViewController:ctlr animated:YES];
    }
}

@end
