#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>

@interface Post : NSObject

+ (instancetype)initWithName:(NSString *)name;
+ (instancetype)initWithName:(NSString *)name
                        user:(NSString *)userName;

@property(strong, nonatomic) NSString *name;
@property(strong, nonatomic) NSString *userName;
@property(strong, nonatomic) PFObject *pfObject;
@end
