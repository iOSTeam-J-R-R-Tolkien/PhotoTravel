#import "Post.h"

#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>

@implementation Post
+ (instancetype)initWithName:(NSString *)name user:(id)user {
  Post *post = [[Post alloc] init];
  post.name = name;

  return post;
}

+ (instancetype)initWithName:(NSString *)name {
  Post *post = [[Post alloc] init];
  post.name = name;

  return post;
}
@end
