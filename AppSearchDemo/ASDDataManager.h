//
//  ASDDataManager.h
//  AppSearchDemo
//
//  Created by Cameron Cooke on 11/06/2015.
//  Copyright © 2015 WideEyedVision. All rights reserved.
//

#import <Foundation/Foundation.h>


extern NSString *const ASDDataManagerKey;
extern NSString *const ASDDataManagerValue;


@interface ASDDataManager : NSObject
@property (nonatomic, strong) NSArray<NSDictionary<NSString *, NSString *> *> *people;

+ (instancetype)sharedInstance;
@end
