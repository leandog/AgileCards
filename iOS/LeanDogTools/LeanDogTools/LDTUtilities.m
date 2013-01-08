#import "LDTUtilities.h"

@implementation LDTUtilities

+ (UIImage*)jpegNamed:(NSString *)name
{
    UIImage *image;
    if(![self isIPhone5]) {
        image = [UIImage imageNamed:name];
    }else {
        image = [self largeImageNamed:name ofType:@".jpg"];
    }
    return image;
}

+ (UIImage*)pngNamed:(NSString *)name
{
    UIImage *image;
    if(![self isIPhone5]) {
        image = [UIImage imageNamed:name];
    }else {
        image = [self largeImageNamed:name ofType:@".png"];
    }
    return image;
}

+ (UIImage*)largeImageNamed:name ofType:(NSString*)imageSuffix
{
   NSString *modName = [name stringByReplacingOccurrencesOfString:imageSuffix withString:@""];
   return [UIImage imageNamed:[NSString stringWithFormat:@"%@-568h@2x%@",modName,imageSuffix]];
}

+ (BOOL)isIPhone5
{
    return [UIScreen mainScreen].bounds.size.height > 500;
}

+ (CGFloat)viewHeight
{
    if([self isIPhone5]){
        return 504;
    }else {
        return 416;
    }
}

@end
