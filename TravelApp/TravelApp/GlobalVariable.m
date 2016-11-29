//
//  GlobalVariable.m
//  TravelApp
//
//  Created by Jeremy on 2016/10/6.
//  Copyright © 2016年 Jeremy. All rights reserved.
//

#import "GlobalVariable.h"


//NSString *const EOCLoginManagerDidLoginNotification = @"Notificaiton";



@implementation GlobalVariable


+ (UIColor *) travelYellowColor {
    return travelRGBColor(255.0f, 216.0f, 76.0f);
}

+ (UIColor*) travelBrownColor {
    return travelRGBColor(79.0f, 24.0f, 8.0f);
}

+ (UIColor*) travelOrangeColor {
    return travelRGBColor(241, 154, 101);
}



+ (CGFloat) mainScreenWith {
    return [UIScreen mainScreen].bounds.size.width;
}

+ (CGFloat) mainScreenHeight {
    
    return [UIScreen mainScreen].bounds.size.height;
}


+ (UIEdgeInsets) UIButtonUPImageDownTitleForImage:(UIButton*)button spacing: (CGFloat) space {
    
    CGSize buttonImageSize = button.imageView.frame.size;
    CGSize buttonTitleSize = button.titleLabel.frame.size;
    CGFloat totalHeight = buttonImageSize.height + buttonTitleSize.height + space;
    
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(-(totalHeight - buttonImageSize.height), 0, 0, -(buttonTitleSize.width));

      return edgeInsets;
}

+ (UIEdgeInsets) UIButtonUPImageDownTitleForTitle:(UIButton*)button spacing: (CGFloat) space{
    
    
    CGSize buttonImageSize = button.imageView.frame.size;
    CGSize buttonTitleSize = button.titleLabel.frame.size;
    CGFloat totalHeight = buttonImageSize.height + buttonTitleSize.height + space;
    
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(0.0f, -buttonImageSize.width, -(totalHeight - buttonTitleSize.height), 0.0f);
    
    return edgeInsets;

}


@end
