#import "Landmark.h"

#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>

#import "Post.h"

@implementation Landmark
+ (instancetype)initWithName:(NSString *)name{
    Landmark *landmark = [[Landmark alloc] init];
    landmark.name = name;
    
    
    landmark.posts = [[NSMutableArray alloc]init];
    return landmark;
}

+ (instancetype)initWithName:(NSString *)name
                    withPost:(Post * ) post{
    Landmark *landmark = [[Landmark alloc] init];
    landmark.name = name;
    
    
    landmark.posts = [[NSMutableArray alloc]init];
    [landmark.posts addObject:post];
    return landmark;
}

+(instancetype)initWithName:(NSString *)name withPosts:(NSArray *)posts{
    Landmark *landmark = [[Landmark alloc] init];
    landmark.name = name;
    
    
    landmark.posts = [[NSMutableArray alloc]init];
    for (Post *post in posts) {
        [landmark.posts addObject:post];
    }
    return landmark;
}
@end
