//
//  ASDResultsVCViewController.m
//  AppSearchDemo
//
//  Created by Tudor Jenkins on 11/06/2015.
//  Copyright © 2015 WideEyedVision. All rights reserved.
//

#import "ASDResultsVCViewController.h"


@interface ASDResultsVCViewController ()
@end


@implementation ASDResultsVCViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.titleLabel.text = [self.personDetails objectForKey:@"title"];
}


@end
