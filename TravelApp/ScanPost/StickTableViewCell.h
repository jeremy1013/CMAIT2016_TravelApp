//
//  StickTableViewCell.h
//  TravelApp
//
//  Created by Jeremy on 2016/11/11.
//  Copyright © 2016年 Jeremy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StickTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *stickLabel;

@property (weak, nonatomic) IBOutlet UILabel *goodLabel;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (assign, nonatomic) BOOL isGood;

@end
