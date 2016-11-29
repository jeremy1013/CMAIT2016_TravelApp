//
//  JCNetworkTools.h
//  TravelApp
//
//  Created by Jeremy on 2016/11/20.
//  Copyright © 2016年 Jeremy. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface JCNetworkTools : AFHTTPSessionManager

+ (instancetype)sharedNetworkTools;
+ (instancetype)sharedNetworkToolsWithoutBaseUrl;

@end
