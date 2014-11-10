#import <UIKit/UIKit.h>

#import "LoadingScreenViewController.h"

#import "Landmark.h"

#import "LandmarkDataProtocol.h"

@interface DetailedImageViewController : UIViewController <LandmarkDataProtocol>

@property(strong, nonatomic) Landmark *landmark;
@property(strong, nonatomic) NSMutableDictionary *cachedImages;
@property(nonatomic) long postIndex;
@property(nonatomic) CGFloat rotationAngle;
@property(nonatomic) CGFloat scaleProportion;

@property(strong, nonatomic) LoadingScreenViewController *popViewController;
@property(weak, nonatomic) IBOutlet UIImageView *imageContainer;
- (IBAction)imagePinch:(UIPinchGestureRecognizer *)sender;
- (IBAction)imageTap:(UITapGestureRecognizer *)sender;
- (IBAction)onImageRotation:(UIRotationGestureRecognizer *)sender;

- (void)noConnectionHandler;

@end
