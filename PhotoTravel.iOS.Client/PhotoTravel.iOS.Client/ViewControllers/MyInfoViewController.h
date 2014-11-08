//
//  MyInfoViewController.h
//  PhotoTravel
//
//  Created by Pesho on 11/7/14.
//  Copyright (c) 2014 PhotoTravel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyInfoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UITextField *profileNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *profileLocationLable;
@property (weak, nonatomic) IBOutlet UILabel *profileGenderLable;
@property (weak, nonatomic) IBOutlet UILabel *profileDataOfBirthLable;

@end
