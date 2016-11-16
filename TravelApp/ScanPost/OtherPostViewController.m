//
//  OtherPostViewController.m
//  TravelApp
//
//  Created by Jeremy on 2016/11/13.
//  Copyright © 2016年 Jeremy. All rights reserved.
//

#import "OtherPostViewController.h"
#import "OtherPostTableViewCell.h"

@interface OtherPostViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *otherPostTableView;

@end

@implementation OtherPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _otherPostTableView.delegate = self;
    _otherPostTableView.dataSource = self;
    
    
    
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


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * cell = @"OtherPostCell";
    OtherPostTableViewCell * otherPostTableViewCell = [_otherPostTableView dequeueReusableCellWithIdentifier:cell forIndexPath:indexPath];
    if (otherPostTableViewCell == nil) {
        otherPostTableViewCell = [[OtherPostTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell];
    }
    
    return cell;
    
    
}




@end
