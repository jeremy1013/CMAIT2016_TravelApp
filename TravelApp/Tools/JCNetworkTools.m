//
//  JCNetworkTools.m
//  TravelApp
//
//  Created by Jeremy on 2016/11/20.
//  Copyright © 2016年 Jeremy. All rights reserved.
//

#import "JCNetworkTools.h"

@implementation JCNetworkTools

+ (instancetype)sharedNetworkTools {
    static JCNetworkTools *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *url = [NSURL URLWithString:@"http://c.m.163.com"];
        
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        instance = [[self alloc]initWithBaseURL:url sessionConfiguration:config];
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
        
    });
    
    return instance;
}


+ (instancetype)sharedNetworkToolsWithoutBaseUrl {
    static JCNetworkTools *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *url = [NSURL URLWithString:@""];
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        instance = [[self alloc]initWithBaseURL:url sessionConfiguration:config];
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
        
    });
    return instance;
    
}


@end
