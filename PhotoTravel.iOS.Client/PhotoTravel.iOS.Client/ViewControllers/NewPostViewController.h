//
//  NewPostViewController.h
//  PhotoTravel.iOS.Client
//
//  Created by Vindicator on 11/10/14.
//  Copyright (c) 2014 Vindicator. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewPostViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *postNameTextField;
@property (weak, nonatomic) IBOutlet UITextView *postDescriptionTextView;

- (IBAction)addNewPostBtn:(id)sender;

@end
