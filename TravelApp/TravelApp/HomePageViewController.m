//
//  HomePageViewController.m
//  TravelApp
//
//  Created by Jeremy on 2016/10/3.
//  Copyright © 2016年 Jeremy. All rights reserved.
//

#import "HomePageViewController.h"
#import "CustomCellTableViewCell.h"
#import "NSMutableArray+ImageArray.h"
#import "GlobalVariable.h"
#import "MyTabBarController.h"



@interface HomePageViewController () <UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource, UITabBarControllerDelegate>

@property (nonatomic) NSInteger flag;
@property (nonatomic) BOOL tend;
@property (nonatomic,strong) NSMutableArray *myArray;

@property (weak, nonatomic) IBOutlet UIScrollView *hpScrollView;

@property (weak, nonatomic) IBOutlet UIPageControl *hpPageControl;

- (IBAction)changePage:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *findActivitiesBtn;
@property (weak, nonatomic) IBOutlet UIButton *launchBtn;

@property (weak, nonatomic) IBOutlet UITableView *hpTableView;


@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    CustomCellTableViewCell * temp = [[CustomCellTableViewCell alloc]init];
//    [temp showTime];
    
    self.hpTableView.delegate = self;
    self.hpTableView.dataSource = self;
    self.tabBarController.delegate = self;
    self.hpScrollView.delegate = self;
    
    
    
    self.myArray = [[NSMutableArray alloc]init];
    _flag = 0;
    [self.myArray addDictObject];
//    for (int i = 0; i < 6; i++) {
//        NSLog(@"%@", self.myArray[i]);
//    }
    
    self.tend = NO;

  
    [self makeUIForScrollView];
    [self makeUIForButton];
    [NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(handleSchedule) userInfo:nil repeats:YES];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (self.tabBarController.tabBar.isHidden) {
        self.tabBarController.tabBar.hidden = NO;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark --makeUI

- (void) makeUIForScrollView {
    
    CGFloat hpMainScreenWith = [GlobalVariable mainScreenWith];
    
    self.hpScrollView.frame = CGRectMake(0, 64,  hpMainScreenWith, 150);
    
    CGFloat contentSizeWidth = self.hpScrollView.frame.size.width * 3;
    CGFloat contentSizeHeight = self.hpScrollView.frame.size.height;
    NSLog(@"%f, %f", contentSizeWidth, contentSizeHeight);
    self.hpScrollView.contentSize = CGSizeMake(contentSizeWidth, contentSizeHeight);
    
    UIImageView * imageView1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"lava"]];
    UIImageView * imageView2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"camping"]];
    UIImageView * imageView3 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cavern"]];
    
    imageView1.frame = CGRectMake(0.0f, 0.0f, contentSizeWidth/3.0, contentSizeHeight);
    imageView2.frame = CGRectMake(contentSizeWidth / 3.0f, 0.0f, contentSizeWidth / 3.0f, contentSizeHeight);
    imageView3.frame = CGRectMake(contentSizeWidth / 3.0f * 2, 0.0f, contentSizeWidth / 3.0f, contentSizeHeight);
    
    
    [self.hpScrollView addSubview:imageView1];
    [self.hpScrollView addSubview:imageView2];
    [self.hpScrollView addSubview:imageView3];
    self.hpTableView.contentInset = UIEdgeInsetsMake(-70, 0, 0, 0);
    
}

- (void) makeUIForButton {
    //    CGFloat findActivitiesImageWidth = self.findActivitiesBtn.imageView.frame.size.width;
    //    CGFloat findActivitiesImageHeight = self.findActivitiesBtn.imageView.frame.size.height;
    //
    //    CGFloat findActivitiesLabelWidth = self.findActivitiesBtn.titleLabel.intrinsicContentSize.width;
    //    CGFloat findActivitiesLabelHeight = self.findActivitiesBtn.titleLabel.intrinsicContentSize.height;
    //
    //    self.findActivitiesBtn.imageEdgeInsets = UIEdgeInsetsMake(-findActivitiesLabelHeight / 2.0, 0, 0, -findActivitiesLabelWidth);
    //    self.findActivitiesBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -findActivitiesImageWidth, -findActivitiesImageHeight/2.0, 0);
    //
    //    NSLog(@"%f, %F, %f, %f", findActivitiesImageWidth, findActivitiesImageHeight, findActivitiesLabelWidth, findActivitiesLabelHeight);
    //
    
    CGFloat spacing = 5.0f;
    CGSize faImageSize = self.findActivitiesBtn.imageView.frame.size;
    CGSize faTitleSize = self.findActivitiesBtn.titleLabel.frame.size;
    
    CGFloat totalHeight = (faImageSize.height + faTitleSize.height + spacing);
    
    self.findActivitiesBtn.imageEdgeInsets = UIEdgeInsetsMake(-(totalHeight - faImageSize.height), 0.0, 0.0, -faTitleSize.width);
    self.findActivitiesBtn.titleEdgeInsets = UIEdgeInsetsMake(0.0, -faImageSize.width, -(totalHeight - faTitleSize.height), 0.0);
    
    CGSize launchImageSize = self.launchBtn.imageView.frame.size;
    CGSize launchTitleSize = self.launchBtn.titleLabel.frame.size;
    
    CGFloat totalHeight2 = (launchImageSize.height + launchTitleSize.height + spacing);
    
    self.launchBtn.imageEdgeInsets = UIEdgeInsetsMake(-(totalHeight2 - launchImageSize.height), 0.0, 0.0, -launchTitleSize.width);
    self.launchBtn.titleEdgeInsets = UIEdgeInsetsMake(0.0, -launchImageSize.width, -(totalHeight2 - launchTitleSize.height), 0.0);
    
}


#pragma mark --UITabBarControllerDelegate

- (BOOL) tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    return YES;
}

- (void) tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    NSInteger tmpTag = viewController.tabBarItem.tag;
    
    UITabBar *tabBar = self.tabBarController.tabBar;
    UITabBarItem *tabBarItem1 = [tabBar.items objectAtIndex:0];
    UITabBarItem *tabBarItem2 = [tabBar.items objectAtIndex:1];
    UITabBarItem *tabBarItem3 = [tabBar.items objectAtIndex:2];
    
    
    switch (tmpTag) {
        case 0:
            tabBarItem1.selectedImage = [[UIImage imageNamed:@"tabBarHomePageClicked"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            break;
        case 1:
            tabBarItem2.selectedImage = [[UIImage imageNamed:@"tabBarCommunityClicked"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            break;
        case 2:
            tabBarItem3.selectedImage = [[UIImage imageNamed:@"tabBarMyselfClicked"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        default:
            break;
    }
    
}


#pragma mark - NavigationToDetail

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"ShowActivityDetail"] || self.tabBarController.tabBar.hidden == NO || [segue.identifier isEqualToString:@"LaunchActivity"]) {
        self.tabBarController.tabBar.hidden = YES;
    }
    
    
}

#pragma mark --handle

- (void) handleSchedule {
    
    ++self.hpPageControl.currentPage;
    
    if (self.tend) {
        [self.hpScrollView setContentOffset:CGPointMake(0.0f, 0.0f) animated:YES];
    }else {
        [self.hpScrollView setContentOffset:CGPointMake(self.hpPageControl.currentPage * self.hpScrollView.frame.size.width, 0.0f) animated:YES];
    }
    
    if (self.hpPageControl.currentPage == 2) {
        _tend = YES;
    }else {
        _tend = NO;
    }
    
    
}


#pragma mark -- UIScrollViewDelegate

- (void) scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.hpScrollView) {
    
        CGPoint offset = scrollView.contentOffset;
    
        self.hpPageControl.currentPage = offset.x / self.hpScrollView.frame.size.width;
        
    }
    if (scrollView == self.hpTableView)
    {
        CGFloat sectionHeaderHeight = 10; //sectionHeaderHeight
        if (scrollView.contentOffset.y <= sectionHeaderHeight && scrollView.contentOffset.y >= 0) {
            
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
            
        } else if (scrollView.contentOffset.y >= sectionHeaderHeight) {
            
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
            
        }
    }
}


- (IBAction)changePage:(id)sender {
}




#pragma mark -- UITableViewDelegate

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
        return 10;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}



#pragma mark --UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
/*    static NSString *CellIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
    NSInteger i = 6;
    
    if (_flag < i) {
    
    
    NSInteger myRow = indexPath.row + _flag;
    
    cell.imageView.image = [UIImage imageNamed: [self.myArray[myRow] objectForKey:@"name"]];
    cell.textLabel.text = [self.myArray[myRow] objectForKey:@"name"];
    
    NSLog(@"%@", _myArray[0]);
    ++_flag;
    
    }
    */
    
    static NSString *CellIdentifier = @"CellIdentifier";

    CustomCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil) {
        cell = [[CustomCellTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    NSInteger i = 6;
    
    if (_flag < i) {
        
        
        NSInteger myRow = indexPath.row + _flag;
        
        cell.ccImageView.image = [UIImage imageNamed:[_myArray[myRow] objectForKey:@"name"]];
        cell.ccLabelName.text = [_myArray[myRow] objectForKey:@"name"];
        cell.ccLeftTime.text = @"剩余时间";
//        cell.labelTime.text = cell.timeStr;
        cell.joinBtn.titleLabel.text = @"立即参加 > >";
        cell.joinBtn.layer.cornerRadius = 4.0f;
        cell.joinBtn.layer.masksToBounds = YES;
        
        
        ++_flag;
        
    }
    

    
    return cell;
    
    
    
}





@end
