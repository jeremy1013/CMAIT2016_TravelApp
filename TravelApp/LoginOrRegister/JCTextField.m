//
//  JCTextField.m
//  TravelApp
//
//  Created by Jeremy on 2016/11/5.
//  Copyright © 2016年 Jeremy. All rights reserved.
//

#import "JCTextField.h"

@implementation JCTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}*/

- (CGRect) leftViewRectForBounds:(CGRect)bounds {
    CGRect leftViewRect = [super leftViewRectForBounds:bounds];
    leftViewRect.origin.x  += 5;
    return leftViewRect;
    
}

- (CGRect) rightViewRectForBounds:(CGRect)bounds {
    CGRect rightViewRect = [super rightViewRectForBounds:bounds];
    rightViewRect.origin.x -= 15;
    return rightViewRect;
}


- (void) JCDrawBorder {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(10, 10)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
    
}




@end
