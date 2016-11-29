//
//  StickTableViewCell.m
//  TravelApp
//
//  Created by Jeremy on 2016/11/11.
//  Copyright © 2016年 Jeremy. All rights reserved.
//

#import "StickTableViewCell.h"


@interface StickTableViewCell ()



@end

@implementation StickTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    _stickLabel.layer.borderWidth = 1.0f;
    _stickLabel.layer.borderColor = TRAVEL_BROWN_COLOR.CGColor;
    _stickLabel.layer.cornerRadius = 3.0f;
    _stickLabel.layer.masksToBounds =  YES;
    
    _goodLabel.layer.borderWidth = 1.0f;
    _goodLabel.layer.borderColor = TRAVEL_BROWN_COLOR.CGColor;
    _goodLabel.layer.cornerRadius = 3.0f;
    _goodLabel.layer.masksToBounds = YES;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



@end
