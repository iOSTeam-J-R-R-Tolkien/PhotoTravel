#import "DetailedImageViewController.h"

#import "Post.h"

#import "LandmarksData.h"
#import "PostsData.h"

#import "ViewsHelper.h"

@interface DetailedImageViewController ()
@property(strong, nonatomic) LoadingScreenViewController *loadingPopup;
@end

@implementation DetailedImageViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  self.cachedImages = [[NSMutableDictionary alloc] init];
  self.loadingPopup = [LoadingScreenViewController initWithParentView:self];
  [self.loadingPopup showOnScreen];

  [ViewsHelper changeBackgroundImage:self withImage:@"bg.jpg"];
    [LandmarksData getLandmarkWithPostsAsync:self.landmark for:self];

    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc]
        initWithTarget:self
                action:@selector(nextImageHandler:)];
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.view addGestureRecognizer:swipeLeft];

    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc]
        initWithTarget:self
                action:@selector(previousImageHandler:)];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:swipeRight];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];

  [self.loadingPopup hideFromScreen];
}

- (IBAction)imagePinch:(UIPinchGestureRecognizer *)sender {
  float scale = sender.scale;
  self.imageContainer.transform = CGAffineTransformMakeScale(scale, scale);
}

- (IBAction)imageTap:(UITapGestureRecognizer *)sender {
  self.imageContainer.transform = CGAffineTransformIdentity;
}

- (IBAction)nextImageHandler:(id)sender {
  if (self.postIndex < [self.landmark.posts count] - 1) {
    self.postIndex++;
  } else {
    self.postIndex = 0;
  }

  [self reloadImage];
}

- (IBAction)previousImageHandler:(id)sender {
  if (self.postIndex > 0) {
    self.postIndex--;
  } else {
    self.postIndex = [self.landmark.posts count] - 1;
  }

  [self reloadImage];
}

- (void)landmarkWithPostsHander:(Landmark *)landmarkData {
  self.landmark = landmarkData;
  [self reloadImage];
}

- (void)reloadImage {
  Post *post = (Post *)self.landmark.posts[self.postIndex];
  NSNumber *postId = post.pfObject.objectId;

  UIImage *imageToLoad = [self.cachedImages objectForKey:postId];
  if (!imageToLoad) {
    [PostsData
        loadImageFromPostAsync:post.pfObject for:self
                andLoadHandler:^(UIImage *image) {
      [self.cachedImages setObject:image forKey:postId];
      [ViewsHelper changeImageSourceWithAnimation:image
                                    forTargetView:self.imageContainer];
                }];
  } else {
    [ViewsHelper changeImageSourceWithAnimation:imageToLoad
                                  forTargetView:self.imageContainer];
  }
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  self.cachedImages = nil;
}

- (void)noConnectionHandler {
  UIAlertView *alert =
      [[UIAlertView alloc] initWithTitle:@"No connection"
                                 message:@"Please ensure your WiFi or mobile "
                                 @"data connection is enabled."
                                delegate:self
                       cancelButtonTitle:@"Ok"
                       otherButtonTitles:nil];
  [alert show];
}

@end
