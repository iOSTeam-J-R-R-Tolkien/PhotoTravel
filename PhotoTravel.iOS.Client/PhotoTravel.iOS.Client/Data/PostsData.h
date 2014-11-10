#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

#import "PostDataProtocol.h"

@interface PostsData : NSObject

+(void)loadImageFromPostAsync:(PFObject *) post for:(id<PostDataProtocol>)resultConsumer andLoadHandler:(void (^)(UIImage *))delegate;

@end
