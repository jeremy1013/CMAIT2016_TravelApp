//
//  SILauchTableViewController.m
//  TravelApp
//
//  Created by Jeremy on 2016/10/6.
//  Copyright © 2016年 Jeremy. All rights reserved.
//

#import "SILauchTableViewController.h"
#import <UIKit/UIKit.h>
#import "ASDateSelectSheet.h"

static CGFloat MainScreenWidth = 0;
static CGFloat MainScreenHeight = 0;


@interface SILauchTableViewController () <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>



@property (weak, nonatomic) IBOutlet UITextField *activityTheme;

@property (weak, nonatomic) IBOutlet UITextField *selectBeginingTime;
- (IBAction)selectingBeginingTime:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *selectEndingTime;
- (IBAction)selectingEndingTime:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *activityAddress;

@property (weak, nonatomic) IBOutlet UITextField *activityPrice;

@property (weak, nonatomic) IBOutlet UITextField *launcherContact;
@property (weak, nonatomic) IBOutlet UITextField *activityMaxNum;
@property (weak, nonatomic) IBOutlet UITextField *enrollSetting;

@property (nonatomic,strong) UIView * containerView;



@end

@implementation SILauchTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.activityTheme.delegate = self;
    self.selectBeginingTime.delegate = self;
    self.selectEndingTime.delegate = self;
    self.activityAddress.delegate = self;
    self.activityPrice.delegate = self;
    self.launcherContact.delegate = self;
    self.activityMaxNum.delegate = self;
    self.enrollSetting.delegate = self;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    MainScreenWidth = [UIScreen mainScreen].bounds.size.width;
    MainScreenHeight = [UIScreen mainScreen].bounds.size.height;
    
//    
//     _containerView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.tableView.frame), MainScreenWidth, MainScreenHeight)];
//    _containerView.backgroundColor = [UIColor whiteColor];
//    

    

    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(16, 482, [UIScreen mainScreen].bounds.size.width - 32, 44);
    [btn setTitle:@"确认发起" forState:UIControlStateNormal];
    [btn setBackgroundColor:TRAVEL_ORANGE_COLOR];
    btn.layer.cornerRadius = 5.0f;
    btn.layer.masksToBounds = YES;
    
    [self.tableView addSubview:btn];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITextFieldDelgate 

- (BOOL) textFieldShouldBeginEditing:(UITextField *)textField {
    return YES;
}

- (void) textFieldDidBeginEditing:(UITextField *)textField {
    
    if (textField == self.selectBeginingTime || textField == self.selectEndingTime) {
    [self.selectBeginingTime resignFirstResponder];
    [self.selectEndingTime resignFirstResponder];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if ([string isEqualToString:@"\n"]) {
        [textField resignFirstResponder];
        return NO;
    }
    return YES;
}


#pragma mark - TableViewDelegate

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

//
//- (UIView *) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//    
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width - 100, 44);
//    [btn setTitle:@"确认发起" forState:UIControlStateNormal];
//    [btn setBackgroundColor:TRAVEL_ORANGE_COLOR];
//    btn.layer.cornerRadius = 5.0f;
//    btn.layer.masksToBounds = YES;
//    return btn;
//    
//}

#pragma mark - Table view data source
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}
*/

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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







- (IBAction)selectingBeginingTime:(id)sender {
    
    //datesheet初始化的frame是整个屏幕。所以是self.tableView.bounds。
    
    ASDateSelectSheet *datesheet = [[ASDateSelectSheet alloc] initWithFrame:self.tableView.bounds];
    //使用代码块传值。从第二个界面传到第一个界面。即：datesheet上面的值传到目前的界面。
    datesheet.GetSelectDate = ^(NSString *dateStr) {
        self.selectBeginingTime.text = dateStr;
    };
    [self.tableView addSubview:datesheet];

    
}


- (IBAction)selectingEndingTime:(id)sender {
    ASDateSelectSheet *datesheet = [[ASDateSelectSheet alloc] initWithFrame:self.tableView.bounds];
    datesheet.GetSelectDate = ^(NSString *dateStr) {
        self.selectEndingTime.text = dateStr;
    };
    [self.tableView addSubview:datesheet];

}
- (IBAction)confirmLaunchEvent:(id)sender {
}
@end
