//
//  UIImageView+RoundImageView.m
//  TravelApp
//
//  Created by Jeremy on 2016/11/13.
//  Copyright © 2016年 Jeremy. All rights reserved.
//

#import "UIImageView+RoundImageView.h"

@implementation UIImageView (RoundImageView)


- (void)setRoundImageView:(BOOL)aImageView {
    
    if (aImageView == YES) {
        self.layer.cornerRadius = self.frame.size.width /2 ;
        self.layer.masksToBounds = YES;
    }
    
    
}


@end
