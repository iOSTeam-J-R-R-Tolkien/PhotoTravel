#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ViewsHelper : NSObject

+ (void)changeBackgroundImage:(UIViewController *)controller
                    withImage:(NSString *)imagePath;

+ (UIImage *)circularScaleNCrop:(UIImage *)sourceImage
             withRectDimensions:(CGRect)rect;
+ (void)changeImageSourceWithAnimation:(UIImage *)imageToLoad
                         forTargetView:(UIImageView *)imageContainer;

@end
