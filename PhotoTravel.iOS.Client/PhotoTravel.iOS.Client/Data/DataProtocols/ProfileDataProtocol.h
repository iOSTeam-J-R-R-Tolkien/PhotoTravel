#import <UIKit/UIKit.h>

#import "ApplicationUser.h"

@protocol UsersDataProtocol

@required
- (void)noConnectionHandler;

@optional
- (void)profileImageLoadHandler:(UIImage *)profileImage;
- (void)userDataLoadHandler:(ApplicationUser *)userData;

@end