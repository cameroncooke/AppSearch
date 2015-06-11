//
//  ASDDataManager.m
//  AppSearchDemo
//
//  Created by Cameron Cooke on 11/06/2015.
//  Copyright © 2015 WideEyedVision. All rights reserved.
//

#import "ASDDataManager.h"
#import <CoreSpotlight/CoreSpotlight.h>


NSString *const ASDDataManagerKey = @"title";
NSString *const ASDDataManagerValue = @"description";


@implementation ASDDataManager


+ (instancetype)sharedInstance
{
    static id sharedInstance = nil;
    @synchronized ([self class]) {
        if (sharedInstance == nil) {
            sharedInstance = [[self alloc] init];
        }
        return sharedInstance;
    }
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createDataSource];
        [self indexForSpotlight];
    }
    return self;
}


-(void)createDataSource
{
    self.people = @[@{ASDDataManagerKey: @"Cameron", ASDDataManagerValue:@"Chats alot"},
                    @{ASDDataManagerKey: @"Tudor", ASDDataManagerValue:@"Dead silent"},
                    @{ASDDataManagerKey: @"Adrain", ASDDataManagerValue:@"Fact boy"}];
}


-(void)indexForSpotlight
{
    NSMutableArray* mySearchableItems = [NSMutableArray new];
    
    NSUInteger id = 0;
    for (NSDictionary* item in self.people) {
        
        CSSearchableItemAttributeSet* attributeSet = [[CSSearchableItemAttributeSet alloc] initWithItemContentType:@"person"];
        [attributeSet setTitle:[item objectForKey:ASDDataManagerKey]];
        [attributeSet setContentDescription:[item objectForKey:ASDDataManagerValue]];
        
        CSCustomAttributeKey *key = [[CSCustomAttributeKey alloc] initWithKeyName:@"com.wideeyedvision.appsearch.key" searchable:YES searchableByDefault:YES unique:YES multiValued:NO];
        [attributeSet setValue:[item objectForKey:ASDDataManagerKey] forCustomKey:key];
        
        NSString*uniqueIdentifier = [NSString stringWithFormat:@"%li", (long)id++];
        CSSearchableItem* item = [[CSSearchableItem alloc] initWithUniqueIdentifier:uniqueIdentifier domainIdentifier:@"com.wideeyedvision.appsearch" attributeSet:attributeSet];
        
        [mySearchableItems addObject:item];
    }
    
    
    [[CSSearchableIndex defaultSearchableIndex] indexSearchableItems:mySearchableItems completionHandler: ^(NSError * __nullable error) {
        
        if (error == nil) {
            NSLog(@"Search items indexed");
        } else {
            NSLog(@"Failed to index items: %@", error.localizedDescription);
        }
    }];
    
    
}


@end
