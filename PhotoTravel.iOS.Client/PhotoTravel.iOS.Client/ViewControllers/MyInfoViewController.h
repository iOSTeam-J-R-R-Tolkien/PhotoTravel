#import <UIKit/UIKit.h>

#import "ProfileDataProtocol.h"

#import "ApplicationUser.h"

@interface MyInfoViewController
    : UIViewController <UsersDataProtocol, UITableViewDataSource>

@property(weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property(weak, nonatomic) IBOutlet UITextField *profileNameLabel;

@property(weak, nonatomic) IBOutlet UITableView *viewTableProfileData;

@property(strong, nonatomic) ApplicationUser *userData;
@property(strong, nonatomic) NSMutableDictionary *userProfileRowsData;
@property(strong, nonatomic) NSArray *userProfileRowsDataKeys;

- (void)userDataLoadHandler:(ApplicationUser *)userData;
- (void)profileImageLoadHandler:(UIImage *)profileImage;
- (void)noConnectionHandler;
@end
