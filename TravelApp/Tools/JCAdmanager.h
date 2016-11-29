//
//  JCAdmanager.h
//  TravelApp
//
//  Created by Jeremy on 2016/11/21.
//  Copyright © 2016年 Jeremy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JCAdmanager : NSObject

+ (BOOL)isShouldDisplayAd;
+ (UIImage *)getAdImage;
+ (void)loadLatestAdImage;


@end
