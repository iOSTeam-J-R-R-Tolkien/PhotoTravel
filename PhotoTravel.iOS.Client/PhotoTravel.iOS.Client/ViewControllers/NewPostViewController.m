//
//  NewPostViewController.m
//  PhotoTravel.iOS.Client
//
//  Created by Vindicator on 11/10/14.
//  Copyright (c) 2014 Vindicator. All rights reserved.
//

#import "NewPostViewController.h"

@interface NewPostViewController ()

@property (nonatomic) UIImagePickerController *imagePickerController;

@property (nonatomic) NSMutableArray *capturedImages;


@end

@implementation NewPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.capturedImages = [[NSMutableArray alloc] init];
    
//    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
//    {
//        // There is not a camera on this device, so don't show the camera button.
//        NSMutableArray *toolbarItems = [self.toolBar.items mutableCopy];
//        [toolbarItems removeObjectAtIndex:2];
//        [self.toolBar setItems:toolbarItems animated:NO];
//    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addNewPostBtn:(id)sender {
}

- (IBAction)addPictureBtn:(id)sender {
    [self showImagePickerForSourceType:UIImagePickerControllerSourceTypeCamera];
}

- (void)showImagePickerForSourceType:(UIImagePickerControllerSourceType)sourceType
{
    if (self.imageView.isAnimating)
    {
        [self.imageView stopAnimating];
    }
    
    if (self.capturedImages.count > 0)
    {
        [self.capturedImages removeAllObjects];
    }
    
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.modalPresentationStyle = UIModalPresentationCurrentContext;
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePickerController.delegate = self;
    
//    if (sourceType == UIImagePickerControllerSourceTypeCamera)
//    {
//        /*
//         The user wants to use the camera interface. Set up our custom overlay view for the camera.
//         */
//        imagePickerController.showsCameraControls = NO;
//        
//        /*
//         Load the overlay view from the OverlayView nib file. Self is the File's Owner for the nib file, so the overlayView outlet is set to the main view in the nib. Pass that view to the image picker controller to use as its overlay view, and set self's reference to the view to nil.
//         */
//        [[NSBundle mainBundle] loadNibNamed:@"OverlayView" owner:self options:nil];
//        self.overlayView.frame = imagePickerController.cameraOverlayView.frame;
//        imagePickerController.cameraOverlayView = self.overlayView;
//        self.overlayView = nil;
//    }
    
    self.imagePickerController = imagePickerController;
    [self presentViewController:self.imagePickerController animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    
    [self.capturedImages addObject:image];
    
//    if ([self.cameraTimer isValid])
//    {
//        return;
//    }
    
    [self finishAndUpdate];
}

- (void)finishAndUpdate
{
    [self dismissViewControllerAnimated:YES completion:NULL];
    
    if ([self.capturedImages count] > 0)
    {
        if ([self.capturedImages count] == 1)
        {
            // Camera took a single picture.
            [self.imageView setImage:[self.capturedImages objectAtIndex:0]];
        }
        else
        {
            // Camera took multiple pictures; use the list of images for animation.
            self.imageView.animationImages = self.capturedImages;
            self.imageView.animationDuration = 5.0;    // Show each captured photo for 5 seconds.
            self.imageView.animationRepeatCount = 0;   // Animate forever (show all photos).
            [self.imageView startAnimating];
        }
        
        // To be ready to start again, clear the captured images array.
        [self.capturedImages removeAllObjects];
    }
    
    self.imagePickerController = nil;
}

@end
