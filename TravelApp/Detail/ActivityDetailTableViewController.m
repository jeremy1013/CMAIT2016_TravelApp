//
//  ActivityDetailTableViewController.m
//  TravelApp
//
//  Created by Jeremy on 2016/10/8.
//  Copyright © 2016年 Jeremy. All rights reserved.
//

#import "ActivityDetailTableViewController.h"
#import "GlobalVariable.h"

@interface ActivityDetailTableViewController () <UITableViewDelegate, UITableViewDataSource>
- (IBAction)cancel:(id)sender;
@property(nonatomic, strong) UIButton * sharingBtn;

@property (nonatomic, strong)UIButton * joinBtn;

- (void)buttonClick:(id)sender;
@end

@implementation ActivityDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.navigationController.navigationItem.backBarButtonItem  =  [[UIBarButtonItem alloc]init];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self makeButtonUI];
}

#pragma mark --makeButtonUI

- (void) makeButtonUI {
    
    CGFloat ADMainScreenWidth = [GlobalVariable mainScreenWith];
    CGFloat ADMainScreenHeight = [GlobalVariable mainScreenHeight];
    
    NSLog(@"%f", ADMainScreenHeight);
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, ADMainScreenHeight - 64 - 40, ADMainScreenWidth, 40)];
    
    _sharingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _sharingBtn.frame = CGRectMake(0, 0, ADMainScreenWidth/2, 40);
    [_sharingBtn setTitle:@"分享" forState:UIControlStateNormal];
    _sharingBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [_sharingBtn setTitleColor:TRAVEL_BROWN_COLOR forState:UIControlStateNormal];
    [_sharingBtn setImage:[UIImage imageNamed:@"sharing"] forState:UIControlStateNormal];
//    sharingBtn.layer.cornerRadius = 10.0;
//    sharingBtn.layer.borderWidth = 1.0f;
    _sharingBtn.backgroundColor = [UIColor clearColor];
    _sharingBtn.imageEdgeInsets = [GlobalVariable UIButtonUPImageDownTitleForImage:_sharingBtn spacing:1.0f];
    _sharingBtn.titleEdgeInsets = [GlobalVariable UIButtonUPImageDownTitleForTitle:_sharingBtn spacing:1.0f];
    
    
    _joinBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _joinBtn.frame = CGRectMake(ADMainScreenWidth / 2, 0,  ADMainScreenWidth /2 , 40);
    [_joinBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_joinBtn setTitle:@"报名参加" forState:UIControlStateNormal];
    _joinBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [_joinBtn setBackgroundColor:TRAVEL_YELLOW_COLOR];
    [_joinBtn setTag:2];
    [_joinBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    [view addSubview:_sharingBtn];
    [view addSubview:_joinBtn];
    
    [self.tableView addSubview:view];
    
}

- (void)buttonClick:(id)sender {
    if ([sender tag] == 2) {
        if ([_joinBtn.currentTitle isEqualToString:@"报名参加"]) {
            [_joinBtn setTitle:@"取消参加" forState:UIControlStateNormal];
        }else {
            [_joinBtn setTitle:@"报名参加" forState:UIControlStateNormal];
        }
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -UITableViewDelgate 







#pragma mark - Table view data source
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}*/

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

@end
