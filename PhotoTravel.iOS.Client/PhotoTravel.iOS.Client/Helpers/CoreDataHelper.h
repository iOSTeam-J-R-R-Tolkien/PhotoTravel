#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataHelper : NSObject

@property(nonatomic,strong) NSManagedObjectContext* context;
@property(nonatomic, strong) NSManagedObjectModel* model;
@property(nonatomic, strong) NSPersistentStoreCoordinator* coordinator;
@property(nonatomic, strong) NSPersistentStore* store;
- (void)saveContext;
- (void)setupCoreData;

@end
