//
//  CommunityTableViewCell.h
//  TravelApp
//
//  Created by Jeremy on 2016/10/5.
//  Copyright © 2016年 Jeremy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommunityTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *comCellImageView;
@property (weak, nonatomic) IBOutlet UILabel *comCellTopic;
@property (weak, nonatomic) IBOutlet UILabel *comCellTopicNum;
@property (weak, nonatomic) IBOutlet UIButton *comCellJoin;

- (void) setButtonProperty;
@end
