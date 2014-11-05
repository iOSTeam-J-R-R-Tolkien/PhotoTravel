//
//  MainLogInViewController.h
//  PhotoTravel
//
//  Created by Pesho Peshev on 11/5/14.
//  Copyright (c) 2014 PhotoTravel. All rights reserved.
//

#import <Parse/Parse.h>

@interface MainLogInViewController : PFLogInViewController<PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate>

@property (nonatomic, strong) UIImageView *fieldsBackground;

@end
