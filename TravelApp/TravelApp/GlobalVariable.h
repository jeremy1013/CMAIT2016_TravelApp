//
//  GlobalVariable.h
//  TravelApp
//
//  Created by Jeremy on 2016/10/6.
//  Copyright © 2016年 Jeremy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



extern UIColor * travelYellowColor;
extern UIColor * travelBrownColor;
extern CGFloat mainScreenWith;
extern CGFloat mainScreenHeitht;

static inline UIColor * travelRGBColor(CGFloat red, CGFloat green, CGFloat blue) {
    
    
    return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:1.0f];
}

@interface GlobalVariable : NSObject

+ (UIColor*) travelYellowColor;
+ (UIColor*) travelBrownColor;
+ (UIColor*) travelOrangeColorl;
+ (CGFloat) mainScreenWith;
+ (CGFloat) mainScreenHeight;

+ (UIEdgeInsets) UIButtonUPImageDownTitleForImage:(UIButton*)button spacing: (CGFloat) space;
+ (UIEdgeInsets) UIButtonUPImageDownTitleForTitle:(UIButton*)button spacing: (CGFloat) space;



@end
