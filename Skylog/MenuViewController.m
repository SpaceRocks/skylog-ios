//
//  MenuViewController.m
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/23/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController()
@property (nonatomic, strong) NSArray *menuItems;
@end

@implementation MenuViewController
@synthesize menuItems;

- (void)awakeFromNib
{
    
    //self.test = [NSArray arrayWithArray:￼[NSArray]
    
    id test = [NSArray arrayWithObjects: @"First", @"Overhead Map", nil];
     [NSArray arrayWithObjects: test, nil];
    self.menuItems = [NSArray arrayWithObjects:
                      [NSMutableArray arrayWithObjects: @"First", @"Overhead Map"],
                      [NSMutableArray arrayWithObjects: @"Second", @"StarGazing Diary"],
                      [NSMutableArray arrayWithObjects: @"Third", @"Social StarGazers"],
                      [NSMutableArray arrayWithObjects: @"Fourth", @"Help Confirm NEOs"],
                      [NSMutableArray arrayWithObjects: @"Fifth", @"Personal Profile"],nil];
    //self.menuItems = [NSArray arrayWithObjects:@"Overhead Map", @"StarGazing Diary", @"Social StarGazers", @"Help Confirm NEOs", @"Personal Profile", nil];
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  [self.slidingViewController setAnchorRightRevealAmount:280.0f];
  self.slidingViewController.underLeftWidthLayout = ECFullWidth;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
  return self.menuItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  NSString *cellIdentifier = @"MenuItemCell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
  }
  
  cell.textLabel.text = [[self.menuItems objectAtIndex:indexPath.row] objectAtIndex: 1];
  
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  NSString *identifier = [NSString stringWithFormat:@"%@Top", [[self.menuItems objectAtIndex:indexPath.row] objectAtIndex: 0]];

  UIViewController *newTopViewController = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
  
  [self.slidingViewController anchorTopViewOffScreenTo:ECRight animations:nil onComplete:^{
    CGRect frame = self.slidingViewController.topViewController.view.frame;
    self.slidingViewController.topViewController = newTopViewController;
    self.slidingViewController.topViewController.view.frame = frame;
    [self.slidingViewController resetTopView];
  }];
}

@end
