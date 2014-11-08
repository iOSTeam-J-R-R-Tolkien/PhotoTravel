//
//  LoginViewController.m
//  PhotoTravel
//
//  Created by Pesho Peshev on 11/5/14.
//  Copyright (c) 2014 PhotoTravel. All rights reserved.
//

#import "LoginViewController.h"
#import "LoadingScreenViewController.h"
#import "ViewsHelper.h"

@implementation LoginViewController

- (void)viewDidLoad {

  [super viewDidLoad];

  self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIImageView *logoImage =
    [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]];
    self.logInView.logo = logoImage;
    [ViewsHelper changeBackgroundImage:self withImage:@"bg.jpg"];
}

@end
