//
//  ASDResultsVCViewController.h
//  AppSearchDemo
//
//  Created by Tudor Jenkins on 11/06/2015.
//  Copyright © 2015 WideEyedVision. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ASDResultsVCViewController : UIViewController
@property (nonatomic, weak) IBOutlet UILabel* titleLabel;
@property( nonatomic, strong) NSDictionary<NSString *, NSString *>* personDetails;
@end
