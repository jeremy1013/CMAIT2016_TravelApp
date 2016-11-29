//
//  JCAdmanager.m
//  TravelApp
//
//  Created by Jeremy on 2016/11/21.
//  Copyright © 2016年 Jeremy. All rights reserved.
//

#import "JCAdmanager.h"
#import "JCNetworkTools.h"

#define kCachedCurrentImage ([[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingString:@"/adcurrent.png"])

#define kCachedNewImage ([[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingString:@"/adnew.png"])


@interface JCAdmanager ()

+ (void)downloadImage:(NSString *)imageUrl;

@end


@implementation JCAdmanager

+ (BOOL)isShouldDisplayAd {
    
    return ([[NSFileManager defaultManager] fileExistsAtPath:kCachedCurrentImage isDirectory:NULL] || [[NSFileManager defaultManager] fileExistsAtPath:kCachedNewImage isDirectory:NULL]);
    
}


+ (UIImage *)getAdImage {
    if ([[NSFileManager defaultManager] fileExistsAtPath:kCachedNewImage isDirectory:NULL]) {
        [[NSFileManager defaultManager] removeItemAtPath:kCachedCurrentImage error:nil];
        [[NSFileManager defaultManager] moveItemAtPath:kCachedNewImage toPath:kCachedCurrentImage error:nil];
    }
    
    return [UIImage imageWithData:[NSData dataWithContentsOfFile:kCachedCurrentImage]];
}

+ (void)downloadImage:(NSString *)imageUrl {
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:imageUrl]];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            [data writeToFile:kCachedNewImage atomically:YES];
        }
    }];
    
    [task resume];
    
}

+ (void)loadLatestAdImage {
    NSInteger now = [[[NSDate alloc]init] timeIntervalSince1970];
    NSLog(@"%ld", now);
    NSString *path = [NSString stringWithFormat:@"http://g1.163.com/madr?app=7A16FBB6&platform=ios&category=startup&location=1&timestamp=%ld",(long)now];

    NSURLSession *Session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionTask *task = [Session dataTaskWithURL:[NSURL URLWithString:path] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
       
        if (error != nil) {
            NSLog(@"%@", error.localizedDescription);
        }else {

            NSStringEncoding GB_2312_Encoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
            NSString * str = [[NSString alloc]initWithData:data encoding:GB_2312_Encoding];

            NSData * utf8Data = [str dataUsingEncoding:NSUTF8StringEncoding];

            NSString * str2 = [[NSString alloc]initWithData:utf8Data encoding:NSUTF8StringEncoding];
    
            NSError * error = nil;
            NSDictionary *tmpDict = [NSJSONSerialization JSONObjectWithData:utf8Data options:NSJSONReadingMutableLeaves error:&error];
            if (error == nil) {
                
                NSLog(@"%@", tmpDict);
                
                
                NSArray *adArray = tmpDict[@"ads"];
                NSString *imgUrl = adArray[0][@"res_url"][0];
                NSString *imgUrl2 = nil;
                if (adArray.count > 1) {
                    imgUrl2 = adArray[1][@"res_url"][0];
                }
                
                NSLog(@"%@", imgUrl2);
                
                NSLog(@"%ld", imgUrl2.length);
                
                BOOL one = [[NSUserDefaults standardUserDefaults] boolForKey:@"one"];
                if (imgUrl2.length > 0) {
                    if (one) {
                        [self downloadImage:imgUrl];
                        [[NSUserDefaults standardUserDefaults] setBool:!one forKey:@"one"];
                    }else {
                        [self downloadImage:imgUrl2];
                        [[NSUserDefaults standardUserDefaults] setBool:!one forKey:@"one"];
                    }
                    
                }else {
                    [self downloadImage:imgUrl];
                }
            }else {
                NSLog(@"%@", error.localizedDescription);
            }
        }
        
        
    }];
    
    NSLog(@"%@", NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES));
    
    [task resume];
    
    
    
   /*
    [[[JCNetworkTools sharedNetworkToolsWithoutBaseUrl] GET:path parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//        NSLog(@"%lld", downloadProgress.completedUnitCount / downloadProgress.totalUnitCount * 100);
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *responseObject) {
        
        
        
//        NSArray *adArray = [responseObject valueForKey:@"ads"];
//        NSString *imgUrl = adArray[0][@"res_url"][0];
//        NSString *imgUrl2 = nil;
//        
//        if (adArray.count > 1) {
//            imgUrl2 = adArray[1][@"res_url"][0];
//        }
//        
//        BOOL one = [[NSUserDefaults standardUserDefaults]boolForKey:@"one"];
//        
//        if (imgUrl2.length > 0) {
//            if (one) {
//                [self downloadImage:imgUrl];
//                [[NSUserDefaults standardUserDefaults]setBool:!one forKey:@"one"];
//            }else {
//                [self downloadImage:imgUrl2];
//                [[NSUserDefaults standardUserDefaults]setBool:!one forKey:@"one"];
//            }
//        }else {
//            [self downloadImage:imgUrl];
//        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }] resume];
    
    
    */
    
}



@end
