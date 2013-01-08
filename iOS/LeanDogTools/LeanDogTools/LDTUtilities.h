#import <Foundation/Foundation.h>

@interface LDTUtilities : NSObject

+ (UIImage*)jpegNamed:(NSString*)name;

+ (UIImage*)pngNamed:(NSString*)name;

+ (CGFloat)viewHeight;

+ (BOOL)isIPhone5;

@end
