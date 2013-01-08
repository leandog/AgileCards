#import "LDTCardDeckViewController.h"
#import "LDTUtilities.h"

@interface LDTCardDeckViewController ()
@property (nonatomic,strong) NSString* imagePrefix;
@property (nonatomic,assign) NSInteger cardCount;
@end

@implementation LDTCardDeckViewController

- (id)initWithTitle:(NSString *)title imagePrefix:(NSString *)imagePrefix andCardCount:(NSInteger)count
{
    self = [self initWithNibName:nil bundle:nil];
    
    if(self) {
        self.title = title;
        self.cardCount = count;
        self.imagePrefix = imagePrefix;
    }
    
    return self;
}


- (void)viewDidLoad
{
    self.scrollView.backgroundColor = [UIColor blackColor];
    self.scrollView.scrollEnabled = YES;
    self.scrollView.pagingEnabled = YES;
    [self loadImages];
    [super viewDidLoad];
}

- (void)loadImages
{
    CGFloat widthOfImage = self.scrollView.frame.size.width;
    CGFloat height = [LDTUtilities viewHeight];
    CGRect imageFrame = self.view.frame;
    imageFrame.size.height = [LDTUtilities viewHeight];
    
    for(int i = 0; i < self.cardCount; i++) {
        NSString *imageName = [NSString stringWithFormat:@"%@_%d.jpg",self.imagePrefix,i];
        UIImageView *imageView= [[UIImageView alloc] initWithFrame:imageFrame];
        imageView.image = [LDTUtilities jpegNamed:imageName];
        CGRect frame = imageView.frame;
        frame.origin = CGPointMake(i * widthOfImage, 0);
        imageView.frame = frame;
        
        [self.scrollView addSubview:imageView];
    }
    
    [self.scrollView setContentSize:CGSizeMake(widthOfImage*self.cardCount,height)];
}

@end
