//
//  ScanPostViewController.m
//  TravelApp
//
//  Created by Jeremy on 2016/11/11.
//  Copyright © 2016年 Jeremy. All rights reserved.
//

#import "ScanPostViewController.h"
#import "StickViewController.h"


@interface ScanPostViewController () <UITableViewDelegate, UITableViewDataSource>





@property (assign, nonatomic) BOOL flag;


@end

@implementation ScanPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    StickViewController * stickViewController = [[StickViewController alloc]init];
    
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    
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
