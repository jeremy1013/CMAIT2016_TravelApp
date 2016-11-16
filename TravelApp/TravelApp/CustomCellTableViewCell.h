//
//  CustomCellTableViewCell.h
//  TravelApp
//
//  Created by Jeremy on 2016/10/5.
//  Copyright © 2016年 Jeremy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCellTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *ccImageView;

@property (weak, nonatomic) IBOutlet UILabel *ccLabelName;

@property (weak, nonatomic) IBOutlet UILabel *ccLeftTime;

@property (weak, nonatomic) IBOutlet UILabel *labelTime;

@property (weak, nonatomic) IBOutlet UIButton *joinBtn;

- (IBAction)joinEvent:(id)sender;

@property (strong, nonatomic)NSTimer *timer;

//@property (strong, nonatomic)NSString* timeStr;

- (void) showTime;

@end
