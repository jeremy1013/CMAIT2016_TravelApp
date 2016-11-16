//
//  ASDateSelectSheet.h
//  TravelApp
//
//  Created by Jeremy on 2016/10/6.
//  Copyright © 2016年 Jeremy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ASDateSelectSheet : UIActionSheet
@property (nonatomic, copy) void(^GetSelectDate)(NSString *dateStr);
@property (nonatomic, strong) NSString * selectDate;


@end
