//
//  LandmarkTableViewController.h
//  PhotoTravel.iOS.Client
//
//  Created by Vindicator on 11/9/14.
//  Copyright (c) 2014 Vindicator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Landmark.h"
#import "LandmarkDataProtocol.h"

@interface LandmarkTableViewController : UITableViewController<LandmarkDataProtocol,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *landmarkNamelable;

@property (weak, nonatomic) IBOutlet UIView *tableCell;

@property (strong, nonatomic) IBOutlet UITableView *tableView;


@property (weak, nonatomic) IBOutlet UIImageView *postImageView;
@property (nonatomic, strong) Landmark *landmarkData;
@end
