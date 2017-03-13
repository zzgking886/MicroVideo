//
//  CCTabbarController.m
//  MicroVideo
//
//  Created by Zhangzhengang on 17/3/10.
//  Copyright © 2017年 Zhangzhengang. All rights reserved.
//

#import "CCTabbarController.h"
#import "MainViewController.h"
#import "FollowViewController.h"
#import "MyViewController.h"
#import "CCNavigationViewController.h"

@interface CCTabbarController ()

@end

@implementation CCTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    MainViewController *mainVC = [[MainViewController alloc] init];
    FollowViewController *followVC = [[FollowViewController alloc] init];
    MyViewController *myViewVC = [[MyViewController alloc] init];
    
    CCNavigationViewController *mainNav = [[CCNavigationViewController alloc] initWithRootViewController:mainVC];
    CCNavigationViewController *followNav = [[CCNavigationViewController alloc] initWithRootViewController:followVC];
    CCNavigationViewController *myViewNav = [[CCNavigationViewController alloc] initWithRootViewController:myViewVC];
    
    NSArray *viewcontrollerList = @[mainNav,followNav,myViewNav];
    NSArray *titleList = @[@"首页",@"关注",@"我的"];
    NSArray *imageList = @[@"Tabbar_main",@"Tabbar_follow",@"Tabbar_myView"];
    NSArray *imageselectList = @[@"Tabbar_mainselect",@"Tabbar_followselect",@"Tabbar_myViewselect"];
    
    NSMutableArray *viewcontrollers = [[NSMutableArray alloc] init];
    for (int i = 0; i < [viewcontrollerList count]; i++)
    {
        UIViewController *oneviewController = [viewcontrollerList objectAtIndex:i];
        oneviewController.title = [NSString stringWithFormat:@"%@", [titleList objectAtIndex:i]];
        [oneviewController.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Helvetica" size:12.0f],NSFontAttributeName,[UIColor blackColor],NSForegroundColorAttributeName,nil] forState:UIControlStateNormal];
        
        [oneviewController.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Helvetica" size:12.0f],NSFontAttributeName,[UIColor colorWithRed:0.18f green:0.40f blue:0.68f alpha:1.00f],NSForegroundColorAttributeName,nil] forState:UIControlStateSelected];
        
        UIImage *normalImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@", [imageList objectAtIndex:i]]];
        UIImage *selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@", [imageselectList objectAtIndex:i]]];
        oneviewController.tabBarItem.image = [normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        oneviewController.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        [viewcontrollers addObject:oneviewController];
    }
    
    [self setViewControllers:viewcontrollers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
