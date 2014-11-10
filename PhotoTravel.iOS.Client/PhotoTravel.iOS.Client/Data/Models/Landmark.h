#import <Parse/Parse.h>

#import "Post.h"

@interface Landmark : NSObject

@property(strong, nonatomic) NSString *name;
@property(strong, nonatomic) NSMutableArray *posts;

@property(strong, nonatomic) PFObject *pfObject;

+ (instancetype)initWithName:(NSString *)name;
+ (instancetype)initWithName:(NSString *)name withPost:(Post *)post;
+ (instancetype)initWithName:(NSString *)name withPosts:(NSArray *)posts;
@end
