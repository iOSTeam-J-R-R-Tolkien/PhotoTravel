//
//  LandmarkUITableViewCell.h
//  PhotoTravel.iOS.Client
//
//  Created by Vindicator on 11/10/14.
//  Copyright (c) 2014 Vindicator. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LandmarkUITableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *postNameLable;
@property (weak, nonatomic) IBOutlet UILabel *userNameLable;
@property (weak, nonatomic) IBOutlet UIImageView *postImageView;


@end
