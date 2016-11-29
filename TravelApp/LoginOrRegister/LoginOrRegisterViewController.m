//
//  LoginOrRegisterViewController.m
//  TravelApp
//
//  Created by Jeremy on 2016/10/3.
//  Copyright © 2016年 Jeremy. All rights reserved.
//

#import "LoginOrRegisterViewController.h"
#import "JCTextField.h"
#import "JCAdmanager.h"
@interface LoginOrRegisterViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *logOrRegImageView;


//@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) JCTextField * accountTextField;

//@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;
@property (weak, nonatomic) JCTextField * pwdTextField;

- (IBAction)userLoginBtn:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *userLogin;

@end

@implementation LoginOrRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.userLogin.layer.cornerRadius = 3.0f;
    self.userLogin.layer.masksToBounds = YES;
    
    self.accountTextField.delegate = self;
    self.pwdTextField.delegate = self;
    
    self.logOrRegImageView.layer.cornerRadius = self.logOrRegImageView.frame.size.width / 2;
    self.logOrRegImageView.layer.masksToBounds = YES;
    

    
    
    UIImageView *accountInputImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"accountInput"]];
    self.accountTextField.leftView = accountInputImage;
    self.accountTextField.leftViewMode = UITextFieldViewModeAlways;
    
    UIImageView *pwdInputImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"pwdInput"]];
    self.pwdTextField.leftView = pwdInputImage;
    self.pwdTextField.leftViewMode = UITextFieldViewModeAlways;
    
    self.logOrRegImageView.image = [UIImage imageNamed:@"userIcon"];
    self.logOrRegImageView.layer.cornerRadius = self.logOrRegImageView.frame.size.width / 2.0;
    self.logOrRegImageView.layer.masksToBounds = YES;
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fillAccountTextField:) name:LoginImmediately object:nil];
    
    NSLog(@"%@", self.accountTextField.text);
    
    
    
    [JCAdmanager loadLatestAdImage];
    if ([JCAdmanager isShouldDisplayAd]) {
        // ------这里主要是容错一个bug。
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"top20"];
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"rightItem"];
        
        
        // ------本想吧广告设置成广告显示完毕之后再加载rootViewController的，但是由于前期已经使用storyboard搭建了，写在AppDelete里会冲突，只好就随便整个view广告
        UIView *adView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        UIImageView *adImg = [[UIImageView alloc]initWithImage:[JCAdmanager getAdImage]];
        UIImageView *adBottomImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"adBottom.png"]];
        [adView addSubview:adBottomImg];
        [adView addSubview:adImg];
        adBottomImg.frame = CGRectMake(0, self.view.frame.size.height - 135, self.view.frame.size.width, 135);
        adImg.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 135);
        
        //        adImg.frame = [UIScreen mainScreen].bounds;
        adView.alpha = 0.99f;
        [self.view addSubview:adView];
        [[UIApplication sharedApplication]setStatusBarHidden:YES];
        
        [UIView animateWithDuration:3 animations:^{
            adView.alpha = 1.0f;
        } completion:^(BOOL finished) {
            [[UIApplication sharedApplication]setStatusBarHidden:NO];
            [UIView animateWithDuration:0.5 animations:^{
                adView.alpha = 0.0f;
            } completion:^(BOOL finished) {
                [adView removeFromSuperview];
            }];
            [[NSNotificationCenter defaultCenter]postNotificationName:@"SXAdvertisementKey" object:nil];
        }];
    }else{
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"update"];
    }

    
    
    
}

- (void)fillAccountTextField:(NSNotification *)notification {
    NSLog(@"%@", notification.object);
    
    NSString * str = notification.object;
    NSLog(@"%@", str);
    
    self.accountTextField.text = notification.object;
    NSLog(@"%@", self.accountTextField.text);
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)userLoginBtn:(id)sender {
    
}




#pragma mark -- UITextFieldDelegate


    


- (BOOL) textFieldShouldBeginEditing:(UITextField *)textField {
    return YES;
}


- (void) textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"textFieldDidBeginEditing");
    
    if (textField == _accountTextField) {
        textField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    }
    
    CGRect frame =textField.frame;
    CGFloat heights = self.view.frame.size.height;
    
    float offset = frame.origin.y + 50 - (heights - 216.0 - 35.0);
    
    NSTimeInterval animationDuration = 0.03f;
    
    [UIView beginAnimations:@"ResizeForKeyBoard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    
    float width = self.view.frame.size.width;
    float height = self.view.frame.size.height;

    if (offset > 0.0f) {
        CGRect rect = CGRectMake(0.0f, -offset, width, height);
        self.view.frame = rect;
    }
    
    [UIView commitAnimations];
    
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"textFieldShouldReturn");
    
    [self.view endEditing:YES];
    
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    
    CGRect rect = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height);
    self.view.frame = rect;
    [UIView commitAnimations];
    [textField resignFirstResponder];
    return  YES;
}

#pragma -----

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesBegan");
    
    [self.view endEditing:YES];
    
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    
    CGRect rect = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height);
    self.view.frame = rect;
    [UIView commitAnimations];
    
}








































@end
