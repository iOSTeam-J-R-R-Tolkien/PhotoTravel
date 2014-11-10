#import <UIKit/UIKit.h>

#import "LandmarkDataProtocol.h"

#import "Landmark.h"

@interface LandmarkTableViewController
    : UITableViewController <LandmarkDataProtocol, UITableViewDataSource>

//@property (weak, nonatomic) IBOutlet UILabel *landmarkNamelable;
//
//@property (weak, nonatomic) IBOutlet UIView *tableCell;
//
//@property (strong, nonatomic) IBOutlet UITableView *tableView;
//
//
//@property (weak, nonatomic) IBOutlet UIImageView *postImageView;
@property(nonatomic, strong) Landmark *landmarkData;
@property(nonatomic) long selectedRow;
@end
