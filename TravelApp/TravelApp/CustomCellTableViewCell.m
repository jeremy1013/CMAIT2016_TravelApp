//
//  CustomCellTableViewCell.m
//  TravelApp
//
//  Created by Jeremy on 2016/10/5.
//  Copyright © 2016年 Jeremy. All rights reserved.
//

#import "CustomCellTableViewCell.h"

@implementation CustomCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}





- (void) showTime {
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(timerFunc) userInfo:nil repeats:YES];
}

- (void) timerFunc {
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"HH:mm:ss"];
    NSDate *date = [[NSDate alloc]init];
    NSString *_timeStr = [formatter stringFromDate:date];
    
    _labelTime.text = _timeStr;
    
    NSLog(@"%@", _labelTime.text);
    NSLog(@"%@", _timeStr);
    
}




- (IBAction)joinEvent:(id)sender {
}
@end
