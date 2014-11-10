#import <UIKit/UIKit.h>
#import "ApplicationUser.h"

@protocol ProfileDataProtocol

@optional
- (void)profileImageLoadHandler:(UIImage *)profileImage;
- (void)userDataLoadHandler:(ApplicationUser *)userData;

@end