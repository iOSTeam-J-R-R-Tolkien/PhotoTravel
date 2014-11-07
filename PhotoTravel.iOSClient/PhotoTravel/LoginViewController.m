//
//  LoginViewController.m
//  PhotoTravel
//
//  Created by Pesho Peshev on 11/5/14.
//  Copyright (c) 2014 PhotoTravel. All rights reserved.
//

#import "LoginViewController.h"
#import "LoadingScreenViewController.h"

@implementation LoginViewController

- (void)viewDidLoad {

  [super viewDidLoad];

  self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIImageView *logoImage =
    [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]];
    self.logInView.logo = logoImage;
}

-(void)viewDidAppear:(BOOL)animated{
    
}

@end
