#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Statistics : NSManagedObject

@property (nonatomic, retain) NSNumber * postsCount;
@property (nonatomic, retain) NSNumber * landmarksCount;
@property (nonatomic, retain) NSNumber * usersCount;
@property (nonatomic, retain) NSDate *lastUpdateDate;

@end
