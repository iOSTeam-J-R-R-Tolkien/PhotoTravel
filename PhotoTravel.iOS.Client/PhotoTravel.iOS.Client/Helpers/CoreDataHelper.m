#import "CoreDataHelper.h"
#import <CoreData/CoreData.h>

@implementation CoreDataHelper

NSString *storeFilename = @"PhotoTravel.sqlite";
- (id)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    _model = [NSManagedObjectModel mergedModelFromBundles:nil];
    _coordinator =
    [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:_model];
    _context = [[NSManagedObjectContext alloc]
                initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_context setPersistentStoreCoordinator:_coordinator];
    return self;
}
- (NSURL *)storeURL {
    return [[self applicationStoresDirectory]
            URLByAppendingPathComponent:storeFilename];
}
- (void)loadStore {
    if (_store) {
        return;
    }
    NSError *error = nil;
    _store = [_coordinator addPersistentStoreWithType:NSSQLiteStoreType
                                        configuration:nil
                                                  URL:[self storeURL]
                                              options:nil
                                                error:&error];
    if (!_store) {
        abort();
    }
}
- (void)setupCoreData {
    [self loadStore];
}
- (NSString *)applicationDocumentsDirectory {
    return [NSSearchPathForDirectoriesInDomains(
                                                NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}
- (void)saveContext {
    if ([_context hasChanges]) {
        NSError *error = nil;
        if (![_context save:&error]) {
            NSLog(@"Failed to save _context: %@", error);
        }
    }
}
- (NSURL *)applicationStoresDirectory {
    NSURL *storesDirectory =
    [[NSURL fileURLWithPath:[self applicationDocumentsDirectory]]
     URLByAppendingPathComponent:@"Stores"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:[storesDirectory path]]) {
        NSError *error = nil;
        if (![fileManager createDirectoryAtURL:storesDirectory
                   withIntermediateDirectories:YES
                                    attributes:nil
                                         error:&error]) {
            NSLog(@"FAILED to create Stores directory: %@", error);
        }
    }
    return storesDirectory;
}

@end
