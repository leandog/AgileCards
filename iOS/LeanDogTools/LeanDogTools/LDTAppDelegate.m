#import "LDTAppDelegate.h"
#import "LDTCardTableViewController.h"

@implementation LDTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    LDTCardTableViewController *rootViewController = [[LDTCardTableViewController alloc]initWithNibName:nil bundle:nil];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:rootViewController];
    navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    navigationController.navigationBar.translucent = NO;
    
    self.window.rootViewController = navigationController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}
@end
