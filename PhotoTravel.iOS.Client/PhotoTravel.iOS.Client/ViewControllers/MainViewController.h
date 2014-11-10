#import <QuartzCore/QuartzCore.h>

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

#import "LandmarkDataProtocol.h"

#import "LoadingScreenViewController.h"

@interface MainViewController
    : UIViewController <PFLogInViewControllerDelegate,
                        PFSignUpViewControllerDelegate, UITableViewDataSource,
                        LandmarkDataProtocol>

@property(nonatomic, strong) NSMutableArray *rowDataArray;
@property(strong, nonatomic) NSMutableDictionary *cachedImages;
@property(nonatomic) long selectedRow;

@property(nonatomic, strong)
    IBOutlet UIActivityIndicatorView *activityIndicator;
@property(nonatomic, strong) UIImage *profileImage;
@property(weak, nonatomic) IBOutlet UITableView *postsTableView;

- (IBAction)addPostToLastAddedLandmark:(id)sender;

- (void)lastPostsDataLoadHandler:(NSMutableArray *)landmarkData;
- (void)noConnectionHandler;

- (IBAction)newPostBtn:(id)sender;

@end
