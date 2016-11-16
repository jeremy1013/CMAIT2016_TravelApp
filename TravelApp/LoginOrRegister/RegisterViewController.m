//
//  RegisterViewController.m
//  TravelApp
//
//  Created by Jeremy on 2016/10/3.
//  Copyright © 2016年 Jeremy. All rights reserved.
//

#import "RegisterViewController.h"
#import "JCTextField.h"
#import "GlobalVariable.h"
#import "RegisterSuccessViewController.h"
#import <AFNetworking/AFNetworking.h>


@interface RegisterViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet JCTextField *phoneTextField;

@property (weak, nonatomic) IBOutlet JCTextField *verifyTextField;

@property (weak, nonatomic) IBOutlet JCTextField *regPwdTextField;

- (IBAction)regCancelBtn:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *regBtn;


@property (strong, nonatomic) UILabel * getCaptcha;


@property (strong, nonatomic) UIScrollView * smallScrollView;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self makeUI];
    
}









- (void) getCaptchaClick {
    
    
    NSString * phoneStr = self.phoneTextField.text;
    
    
    if ([_getCaptcha.text isEqualToString:@"验证码"] && [phoneStr length] == 11) {
        self.getCaptcha.userInteractionEnabled = NO;
        __block NSInteger times = 59;
        _getCaptcha.text = @"59秒";
        //请求验证码
        [self startRequest];
        
        NSTimer * timer = [NSTimer timerWithTimeInterval:1.0f repeats:YES block:^(NSTimer * _Nonnull timer) {
            if (times == 0) {
                [timer invalidate];
                _getCaptcha.text = @"验证码";
                self.getCaptcha.userInteractionEnabled = YES;
            }else {
                times--;
                _getCaptcha.text = [NSString stringWithFormat:@"%ld秒", times];
                
            }
            
            
        }];
        
        [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    } else if ([_getCaptcha.text isEqualToString:@"验证码"] && [phoneStr length] != 11) {
        
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"错误" message:@"手机格式输入错误请重新输入" preferredStyle:(UIAlertControllerStyleAlert)];
        
        [self presentViewController:alertController animated:YES completion:^{
            NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:1.0f repeats:NO block:^(NSTimer * _Nonnull timer) {
                [alertController dismissViewControllerAnimated:YES completion:nil];
            }];
        }];
        
        
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) startRequest {
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    
    NSDictionary * dictPara = @{@"phone":@"18826077175"};
//    NSDictionary *dictPara = [[NSDictionary alloc]init];
//    [dictPara setValue:self.phoneTextField.text forKey:@"phone"];
    

    //responseObject 是一个已经解析好的NSDictionary类型的数据。所以如果返回的是JSON数据。不用再调用NSJSONSerialization JSONObjectWithData: options: error:]了
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager POST:@"http://www.quqiongyou.cn/quqiongyou/zhuce1/sendMsg.php" parameters:dictPara progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@--%@", task.response, responseObject);
        self.verifyTextField.text = responseObject[@"data"];
    }
    failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@---%@", task.response, error);
        
    }];
    
    
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation

//sender指的是你按哪个事件触发的prepareForSegue函数
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"RegisterSuccess"]) {
        NSString *msg = self.phoneTextField.text;
    
        NSLog(@"%@", segue.identifier);

        RegisterSuccessViewController * rsVC = segue.destinationViewController;
        if ([rsVC respondsToSelector:@selector(setData:)]) {
            [rsVC setValue:msg forKey:@"_data"];
        }
        
    }
    
}


- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    
    
    
    if ([identifier isEqualToString:@"RegisterSuccess"] && self.phoneTextField.text.length != 0 && self.verifyTextField.text.length != 0 && self.regPwdTextField.text.length != 0 ) {
        return YES;
    }
    else {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"错误" message:@"注册信息填写不完整，请填写验证码或密码" preferredStyle:(UIAlertControllerStyleAlert)];
        [self presentViewController:alertController animated:YES completion:^{
            NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:1.0f repeats:NO block:^(NSTimer * _Nonnull timer) {
                [alertController dismissViewControllerAnimated:YES completion:nil];
            }];
        }];
        
        return NO;
    }
    
    
    
    
}



#pragma mark --UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    if (textField == _phoneTextField || textField == _verifyTextField) {
        textField.keyboardType = UIKeyboardTypeNamePhonePad;
    }
}



- (IBAction)regCancelBtn:(id)sender {
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


#pragma mark --makeUI

- (void) makeUI {
    self.phoneTextField.delegate = self;
    self.verifyTextField.delegate = self;
    self.regPwdTextField.delegate = self;
    
    
    self.phoneTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.phoneTextField.layer.borderWidth = 0.7f;
    self.phoneTextField.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Phone-number"]];
    self.phoneTextField.leftViewMode = UITextFieldViewModeAlways;
    
    
    self.verifyTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.verifyTextField.layer.borderWidth = 0.7f;
    self.verifyTextField.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Cell-phone-verification-code"]];
    self.verifyTextField.leftViewMode = UITextFieldViewModeAlways;
    
    
    self.regPwdTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.regPwdTextField.layer.borderWidth = 0.7f;
    self.regPwdTextField.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Password"]];
    self.regPwdTextField.leftViewMode = UITextFieldViewModeAlways;
    
    self.regBtn.layer.cornerRadius = 5.0f;
    self.regBtn.layer.masksToBounds = YES;
    
    
    self.getCaptcha = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 70,35)];
    self.getCaptcha.userInteractionEnabled = YES;
    self.getCaptcha.text = @"验证码";
    self.getCaptcha.textAlignment = NSTextAlignmentCenter;
    self.getCaptcha.font = [UIFont systemFontOfSize:17.0f];
    self.getCaptcha.backgroundColor = TRAVEL_YELLOW_COLOR;
    self.getCaptcha.textColor = TRAVEL_BROWN_COLOR;
    self.getCaptcha.layer.cornerRadius = 3.0f;
    self.getCaptcha.layer.masksToBounds = YES;
    
    
    
    [self.getCaptcha addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(getCaptchaClick)]];
    
    self.phoneTextField.rightView = self.getCaptcha;
    self.phoneTextField.rightViewMode = UITextFieldViewModeAlways;
    
    
    
    

}



@end
