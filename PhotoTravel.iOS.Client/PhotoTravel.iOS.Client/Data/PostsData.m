#import "PostsData.h"

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

#import "PostDataProtocol.h"
#import "EnvironmentHelper.h"

@implementation PostsData

+(void)loadImageFromPostAsync:(PFObject *) post for:(id<PostDataProtocol>)resultConsumer andLoadHandler:(void (^)(UIImage *))delegate{
  BOOL isConnected = [EnvironmentHelper isInternetConnectionEstablished];
  if (!isConnected) {
    [resultConsumer noConnectionHandler];
    return;
  }

  PFFile *userImageFile = post[@"image"];
  [userImageFile
      getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
          if (!error) {
            UIImage *image = [UIImage imageWithData:imageData];
            delegate(image);
          }
      }];
}

@end
