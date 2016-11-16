//
//  ASDateSelectSheet.m
//  TravelApp
//
//  Created by Jeremy on 2016/10/6.
//  Copyright © 2016年 Jeremy. All rights reserved.
//

#import "ASDateSelectSheet.h"
#import <UIKit/UIKit.h>

static CGFloat MainScreenWidth = 0;
static CGFloat MainScreenHeight = 0;


@interface ASDateSelectSheet ()


@property(nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIDatePicker * datePicker;
@property (nonatomic, strong) NSDateFormatter * formatter;
@property (nonatomic, strong) UIButton *btnDone;
@property (nonatomic, strong) UIButton * btnCancel;


@end


@implementation ASDateSelectSheet

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


//datesheet初始化的frame是整个屏幕。所以是self.tableView.bounds。可看到整个屏幕都有一层半透明的背景。因为
//[self setBackgroundColor:[UIColor colorWithWhite:0.5 alpha:0.5]];的缘故。
//所以[self addGestureRecognizer:tap];在点击半透明的其他地方的时候会有反应。

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        MainScreenHeight = [UIScreen mainScreen].bounds.size.height;
        MainScreenWidth = [UIScreen mainScreen].bounds.size.width;
        [self setBackgroundColor:[UIColor colorWithWhite:0.5 alpha:0.5]];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickEmpty:)];
        [self addGestureRecognizer:tap];
        [self makeUI];
    }
    return self;
}

- (void) makeUI {
    
    _containerView = [[UIView alloc]initWithFrame:CGRectMake(10, MainScreenHeight - 290 -70, MainScreenWidth - 20, 290)];
    _containerView.backgroundColor = [UIColor whiteColor];
    _containerView.layer.cornerRadius = 3;
    _containerView.layer.masksToBounds = YES;
    
    _datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, 10, MainScreenWidth - 20, 200)];
    [_datePicker setDate:[NSDate date] animated:YES];
    [_datePicker setMinimumDate:[NSDate date]];
    [_datePicker setDatePickerMode:UIDatePickerModeDate];
    [_datePicker setMaximumDate:[self.formatter dateFromString:@"2018-01-01"]];
    [_datePicker addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventValueChanged];
    [_containerView addSubview:_datePicker];

    
    
    _btnDone = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnDone.frame = CGRectMake(-0.4, CGRectGetMaxY(_datePicker.frame), MainScreenWidth - 19.2, 40);
    [_btnDone setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_btnDone setTitle:@"确定" forState:UIControlStateNormal];
    [_btnDone addTarget:self action:@selector(doneAction:) forControlEvents:UIControlEventTouchUpInside];
    _btnDone.layer.borderWidth = 0.3;
    _btnDone.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [_containerView addSubview:_btnDone];


    _btnCancel = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnCancel.frame = CGRectMake(0, CGRectGetMaxY(_btnDone.frame), MainScreenWidth - 20, 40);
    [_btnCancel setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_btnCancel setTitle:@"取消" forState:UIControlStateNormal];
    [_btnCancel addTarget:self action:@selector(cancelAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [_containerView addSubview:_btnCancel];
    
    
    [self addSubview:_containerView];
    
    
}

#pragma mark -- private method
- (void) clickEmpty:(UITapGestureRecognizer *)tap {
    [self removeFromSuperview];
}



#pragma mark -- action
- (void) doneAction:(UIButton*)btn {
    if (self.GetSelectDate) {
        _GetSelectDate([self.formatter stringFromDate:_datePicker.date]);
        [self removeFromSuperview];
    }
    
}

- (void)cancelAction:(UIButton *)btn {
    [self removeFromSuperview];
}

- (void)dateChange:(id)datePicker {
    
}

#pragma mark --setter 、getter
- (void)setSelectDate:(NSString*)selectDate {
    
    //setDate是_datePicker本身的setter方法。因为_datePickerb本身有date属性
    [_datePicker setDate:[self.formatter dateFromString:selectDate] animated:YES];
}


//懒加载
- (NSDateFormatter*)formatter {
    if (_formatter) {
        return _formatter;
    }
    
    _formatter = [[NSDateFormatter alloc]init];
    [_formatter setDateFormat:@"yyyy-MM-dd"];
    return _formatter;
}


@end





