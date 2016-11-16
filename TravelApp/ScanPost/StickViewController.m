//
//  StickViewController.m
//  TravelApp
//
//  Created by Jeremy on 2016/11/12.
//  Copyright © 2016年 Jeremy. All rights reserved.
//

#import "StickViewController.h"
#import "StickTableViewCell.h"

@interface StickViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *stickTableView;

@property (assign, nonatomic) NSInteger flag;

@end

@implementation StickViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    _stickTableView.delegate = self;
    _stickTableView.dataSource = self;
    _flag = 0;
    
    
    _stickTableView.backgroundColor = TRAVEL_YELLOW_COLOR;
    
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


#pragma mark -- _stickTableView delegate







#pragma mark -- _stickTableView dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * cell = @"StickCell";
    StickTableViewCell * stickTableViewCell = [_stickTableView dequeueReusableCellWithIdentifier:cell forIndexPath:indexPath];
    if (stickTableViewCell == nil) {
        stickTableViewCell = [[StickTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell];
    }
    
    _flag++;
    NSString * str = [NSString stringWithFormat:@"%ld", _flag];
    stickTableViewCell.isGood = NO;
    if (stickTableViewCell.isGood == NO) {
        
        stickTableViewCell.stickLabel.text = @"置顶";
//        stickTableViewCell.goodLabel.text = str;
        stickTableViewCell.titleLabel.text = @"旅行旅行旅行是的发生大法师打发";
        
    }
    
    NSLogRect(stickTableViewCell.frame);
    
    
    
    
    
    return stickTableViewCell;
    
    
}






@end
