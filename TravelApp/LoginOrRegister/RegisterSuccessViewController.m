//
//  RegisterSuccessViewController.m
//  TravelApp
//
//  Created by Jeremy on 2016/10/3.
//  Copyright © 2016年 Jeremy. All rights reserved.
//

#import "RegisterSuccessViewController.h"


@interface RegisterSuccessViewController ()


@property (weak, nonatomic) IBOutlet UIButton *btn;


@property (weak, nonatomic) IBOutlet UILabel *label;


@end

@implementation RegisterSuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.labelRegSuccess.text = @"ceshi";
    
    
    self.btn.layer.cornerRadius = 5.0f;
    self.btn.layer.masksToBounds = YES;
    
    
    self.navigationItem.title = @"注册成功";
    
    UIBarButtonItem *btnItem  = [[UIBarButtonItem alloc]initWithCustomView:[[UIView alloc]init]];
    
    self.navigationItem.leftBarButtonItem = btnItem;
    
    NSString *str = [NSString stringWithFormat:@"会员账号: %@ 已成功注册", _data];
    self.label.text = str;
    
}

/*
- (void) showSuccessOnLabel:(NSNotification *)notification {
    
    
    self.labelStr = [NSString stringWithFormat:@"会员账号：%@ 已成功注册", notification.object];
//    self.labelRegSuccess.text = str;  //// str是个临时对象。在这个函数调用完毕之后。会自动销毁。所以Label的text为空白。
//    self.labelStr = [[[NSString alloc]initWithFormat:@"会员账号：%@ 已成功注册",acStr] copy];
    
    CGFloat labelx = CGRectGetMinX(_btn.frame);
    CGFloat labely = CGRectGetMinY(_btn.frame) + 50;
    CGFloat labelw = CGRectGetWidth(_btn.frame);
    CGFloat labelh = CGRectGetHeight(_btn.frame);
    _label = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 40)];
    
    
    
    NSLog(@"%@, %@",_label, [NSThread currentThread]);
    
    
    
    
    _label.text = self.labelStr;
    NSLog(@"%@, %@", _label.text, [NSThread currentThread]);
    
    
    [self.view addSubview:_label];
    NSLog(@"%@, %@", _label, [NSThread currentThread]);
    
    self.textField.text = self.labelStr;
    if (_textField.text == nil) {
        
    
    self.textField.text = @"s";
    }
    
    
    
    
}*/


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
     [[NSNotificationCenter defaultCenter] postNotificationName:LoginImmediately object:_data userInfo:nil];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    
//    [[NSNotificationCenter defaultCenter] postNotificationName:LoginImmediately object:_data];
    
//    [[NSNotificationCenter defaultCenter] postNotificationName:LoginImmediately object:_data userInfo:nil];
}


@end
