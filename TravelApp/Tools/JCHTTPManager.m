//
//  JCHTTPManager.m
//  TravelApp
//
//  Created by Jeremy on 2016/11/20.
//  Copyright © 2016年 Jeremy. All rights reserved.
//

#import "JCHTTPManager.h"

@implementation JCHTTPManager

+ (instancetype)manager {
    
    JCHTTPManager *mgr = [super manager];
    
    NSMutableSet *mgrSet = [NSMutableSet set];
    mgrSet.set = mgr.responseSerializer.acceptableContentTypes;
    [mgrSet addObject:@"text/html"];
    
    mgr.responseSerializer.acceptableContentTypes = mgrSet;
    return mgr;
}


@end
