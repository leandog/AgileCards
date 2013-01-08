#import <UIKit/UIKit.h>

@interface LDTCardDeckViewController : UIViewController

@property (nonatomic,weak) IBOutlet UIScrollView *scrollView;

- (id)initWithTitle:(NSString*)title imagePrefix:(NSString*)imagePrefix andCardCount:(NSInteger)cardCount;
@end
