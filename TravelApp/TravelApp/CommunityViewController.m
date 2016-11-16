//
//  CommunityViewController.m
//  TravelApp
//
//  Created by Jeremy on 2016/10/5.
//  Copyright © 2016年 Jeremy. All rights reserved.
//

#import "CommunityViewController.h"
#import "CommunityTableViewCell.h"
#import <QuartzCore/QuartzCore.h>
#import "NSMutableArray+ImageArray.h"
#import "GlobalVariable.h"

@interface CommunityViewController ()  <UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *comScrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *comPageControl;
@property (weak, nonatomic) IBOutlet UITableView *comTableView;

@property (nonatomic) BOOL tend;
@property (strong, nonatomic)NSMutableArray * myArray;


@end

@implementation CommunityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    _myArray = [[NSMutableArray alloc]init];
    [_myArray addDictObject];
    
    self.comTableView.delegate = self;
    self.comTableView.dataSource = self;
    
    self.comScrollView.delegate = self;
    
    _tend = NO;
    
    [self makeForScrollView];
    [NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(comHandleTimer) userInfo:nil repeats:YES];
    
    self.automaticallyAdjustsScrollViewInsets = NO;

    
}

#pragma mark -- makeUI

- (void) makeForScrollView {
    
    
   
    CGFloat mainScreenWith = [GlobalVariable mainScreenWith];
    
    self.comScrollView.frame = CGRectMake(0, 64, mainScreenWith, 150);
    
    CGSize SVsize = self.comScrollView.frame.size;
    
    self.comScrollView.contentSize = CGSizeMake(SVsize.width * 3, SVsize.height);
    
    UIImageView * imageView1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"lava"]];
    imageView1.frame = CGRectMake(0.0f, 0.0f, SVsize.width, SVsize.height);
    
    UIImageView * imageView2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"camping"]];
    imageView2.frame = CGRectMake(SVsize.width, 0.0f, SVsize.width, SVsize.height);
    
    
    UIImageView * imageView3 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cavern"]];
    imageView3.frame = CGRectMake(SVsize.width * 2, 0.0f, SVsize.width, SVsize.height);
    
    [self.comScrollView addSubview:imageView1];
    [self.comScrollView addSubview:imageView2];
    [self.comScrollView addSubview:imageView3];
    
    
    

}


- (void) comHandleTimer {
    ++self.comPageControl.currentPage;
    if (_tend) {
        [self.comScrollView setContentOffset:CGPointMake(0.0f, 0.0f) animated:YES];
    }else {
        [self.comScrollView setContentOffset:CGPointMake(self.comPageControl.currentPage * self.comScrollView.frame.size.width, 0.0f) animated:YES];
    }
    
    if (self.comPageControl.currentPage == 2) {
        _tend = YES;
    }else {
        _tend = NO;
    }
    
}


- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated ];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (scrollView == self.comScrollView) {
    self.comPageControl.currentPage = scrollView.contentOffset.x / self.comScrollView.frame.size.width;
    }
    if (scrollView == self.comTableView) {
        
            CGFloat sectionHeaderHeight = 40; //sectionHeaderHeight
            if (scrollView.contentOffset.y <= sectionHeaderHeight && scrollView.contentOffset.y >= 0) {
                
                scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
                
            } else if (scrollView.contentOffset.y >= sectionHeaderHeight) {
                
                scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
                
            }
        
    }
    
    
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/




#pragma mark - Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
 return 2;
}
 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
 return 2;
}
 


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
     static NSString * CellIdentifier = @"Cell";
     
     CommunityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
 
     if (cell == nil) {
         cell = [[CommunityTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
     }
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        cell.comCellImageView.image = [UIImage imageNamed:@"freeGuidePic"];
        cell.comCellImageView.layer.cornerRadius = cell.comCellImageView.frame.size.width / 2.0f;
        cell.comCellImageView.layer.masksToBounds = YES;
        cell.comCellTopic.text = @"逃票攻略";
        cell.comCellTopicNum.text = @"主题数: 255534";
        cell.comCellJoin.hidden = YES;
    }else if (indexPath.section == 0 && indexPath.row == 1) {
        cell.comCellImageView.image = [UIImage imageNamed:@"ridingPic"];
        cell.comCellImageView.layer.cornerRadius = cell.comCellImageView.frame.size.width / 2.0f;
        cell.comCellImageView.layer.masksToBounds = YES;
        cell.comCellTopic.text = @"骑行";
        cell.comCellTopicNum.text = @"主题数: 21565";
        cell.comCellJoin.hidden = YES;
    }else {
        cell.comCellImageView.image = [UIImage imageNamed:@"driftPic"];
        cell.comCellImageView.layer.cornerRadius = cell.comCellImageView.frame.size.width / 2.0f;
        cell.comCellImageView.layer.masksToBounds = YES;
        cell.comCellTopic.text = @"野外漂流";
        cell.comCellTopicNum.text = @"主题数: 149415";
        [cell setButtonProperty];
        cell.comCellJoin.hidden = NO;
        
    }
    
    
    
    
    
     
     
     
     return cell;
}

//- (nullable NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    if (section == 0) {
//        return @"我的圈子";
//    }else {
//        return @"推荐圈子";
//    }
//    
//}

- (UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSString * sectionTitle;
    if (section == 0) {
            sectionTitle = @"我的圈子";
    }else {
        sectionTitle = @"推荐圈子";
    }
    
    if (sectionTitle == nil) {
        return nil;
    }
    
    UILabel * label = [[UILabel alloc]init];
    label.frame = CGRectMake(30.0f, 7.5f, 100.0f, 25.0f);
    label.textColor = [UIColor lightGrayColor];
    label.font = [UIFont systemFontOfSize:17.0f];
    label.text = sectionTitle;
//    label.layer.borderColor = [UIColor blackColor].CGColor;
//    label.layer.borderWidth = 3.0f;
    
    
    UIImageView * imageView = [[UIImageView alloc]init];
    imageView.frame = CGRectMake(20.0f, 7.5f, 4.0f, 25.0f);
    imageView.backgroundColor = TRAVEL_YELLOW_COLOR;
    
    
    
    
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, self.comTableView.frame.size.width, 40.0f)];
    [view addSubview:imageView];
    [view addSubview:label];
    
    NSLog(@"%f, %f, %f, %f", view.frame.origin.x, view.frame.origin.y
          , view.frame.size.width, view.frame.size.height);
    [self setBorderWithView:view top:NO left:NO bottom:YES right:NO borderColor:[UIColor grayColor] borderWidth:0.3f];
    

    return view;
    
    
}





//- (nullable UITableViewHeaderFooterView *)headerViewForSection:(NSInteger)section {
//    
//}


#pragma mark --UITableViewDelegate

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}


- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
        return 80;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 15.0f;
}


#pragma mark --UIScrollViewDelegate  ---UITableView


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
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


- (void)setBorderWithView:(UIView *)view top:(BOOL)top left:(BOOL)left bottom:(BOOL)bottom right:(BOOL)right borderColor:(UIColor *)color borderWidth:(CGFloat)width
{
    if (top) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, 0, view.frame.size.width, width);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
    if (left) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, 0, width, view.frame.size.height);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
    if (bottom) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, view.frame.size.height - width, view.frame.size.width, width);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
    if (right) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(view.frame.size.width - width, 0, width, view.frame.size.height);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
}


- (IBAction)JoinAction:(id)sender {
}
@end
