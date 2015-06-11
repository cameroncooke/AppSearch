//
//  ASDMainViewController.m
//  AppSearchDemo
//
//  Created by Tudor Jenkins on 11/06/2015.
//  Copyright © 2015 WideEyedVision. All rights reserved.
//

#import "ASDMainViewController.h"
#import "ASDResultsVCViewController.h"
#import "ASDDataManager.h"


@interface ASDMainViewController () <UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, weak) IBOutlet UITableView* tableView;
@end


@implementation ASDMainViewController


-(void)prepareForSegue:(nonnull UIStoryboardSegue *)segue sender:(nullable id)sender
{
    NSString *identifier = segue.identifier;    
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
    if ([identifier isEqualToString:@"resultsSegue"])
    {
        NSDictionary *person = [ASDDataManager sharedInstance].people[indexPath.row];
        
        ASDResultsVCViewController *page = (ASDResultsVCViewController *)segue.destinationViewController;
        page.personDetails = person;
        
    }
}


- (BOOL)restoreUserActivityStateWithPersonIndex:(NSUInteger)indexOfPerson
{
    NSArray *people  = [ASDDataManager sharedInstance].people;
    if (indexOfPerson >= people.count) {
        return NO;
    }
    
    NSDictionary *person = people[indexOfPerson];
    
    ASDResultsVCViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"ASDResultsVCViewController"];
    controller.personDetails = person;
    [self.navigationController setViewControllers:@[self, controller] animated:YES];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:indexOfPerson inSection:0];
    [self.tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionTop];
    
    return YES;
}


# pragma mark -
# pragma mark UITableView

-(NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [ASDDataManager sharedInstance].people.count;
    
}


-(nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    NSDictionary *person = [ASDDataManager sharedInstance].people[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell" forIndexPath:indexPath];
    cell.textLabel.text =  person[ASDDataManagerKey];
    cell.detailTextLabel.text =  person[ASDDataManagerValue];
    
    return cell;
}


@end
