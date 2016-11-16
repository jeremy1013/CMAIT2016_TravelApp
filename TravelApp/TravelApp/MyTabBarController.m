//
//  MyTabBarController.m
//  TravelApp
//
//  Created by Jeremy on 2016/10/29.
//  Copyright © 2016年 Jeremy. All rights reserved.
//

#import "MyTabBarController.h"
#import "GlobalVariable.h"

@interface MyTabBarController ()

@property(nonatomic, strong) UITabBarItem * tabBarItem1;
@property(nonatomic, strong) UITabBarItem * tabBarItem2;
@property(nonatomic, strong) UITabBarItem * tabBarItem3;



@end

@implementation MyTabBarController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.delegate = self;
    
    
    [self makeUIForTabBar];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark --makeUI
 
- (void) makeUIForTabBar {
 
    UITabBar *tabBar = self.tabBar;
 
    tabBar.tintColor = TRAVEL_BROWN_COLOR;
    tabBar.unselectedItemTintColor = TRAVEL_BROWN_COLOR;
 
    _tabBarItem1 = [tabBar.items objectAtIndex:0];
    _tabBarItem2 = [tabBar.items objectAtIndex:1];
    _tabBarItem3 = [tabBar.items objectAtIndex:2];
 
    _tabBarItem1.tag = 0;
    _tabBarItem2.tag = 1;
    _tabBarItem3.tag = 2;
 
    _tabBarItem1.title = @"首页";
    _tabBarItem2.title = @"社区";
    _tabBarItem3.title = @"我的";
    
    _tabBarItem1.image = [[UIImage imageNamed:@"tabBarHomePage"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _tabBarItem1.selectedImage = [[UIImage imageNamed:@"tabBarHomePageClicked"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _tabBarItem2.image = [[UIImage imageNamed:@"tabBarCommunity"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _tabBarItem3.image = [[UIImage imageNamed:@"tabBarMyself"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
  
}

/*
#pragma mark -- UITabBarControllerDelegate

- (BOOL) tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    return YES;
}

- (void) tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    NSLog(@"my:d");
    NSInteger tmpTag = viewController.tabBarItem.tag;
    switch (tmpTag) {
        case 0:
            NSLog(@"my0");
            _tabBarItem1.selectedImage = [[UIImage imageNamed:@"tabBarHomePageClicked"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            break;
        case 1:
            NSLog(@"my2");
            _tabBarItem2.selectedImage = [[UIImage imageNamed:@"tabBarCommunityClicked"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            break;
        case 2:
            NSLog(@"my3");
            _tabBarItem3.selectedImage = [[UIImage imageNamed:@"tabBarMyselfClicked"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        default:
            break;
    }
    
}
*/
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
