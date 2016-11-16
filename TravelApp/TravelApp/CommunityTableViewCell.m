//
//  CommunityTableViewCell.m
//  TravelApp
//
//  Created by Jeremy on 2016/10/5.
//  Copyright © 2016年 Jeremy. All rights reserved.
//

#import "CommunityTableViewCell.h"
#import "GlobalVariable.h"

@implementation CommunityTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setButtonProperty {
    _comCellJoin.layer.cornerRadius = 3.0f;
    _comCellJoin.layer.masksToBounds = YES;
    _comCellJoin.layer.borderWidth = 1.0f;
    _comCellJoin.layer.borderColor = TRAVEL_BROWN_COLOR.CGColor;
    
}

@end
