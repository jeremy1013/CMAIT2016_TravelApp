//
//  NSMutableArray+ImageArray.m
//  TravelApp
//
//  Created by Jeremy on 2016/10/4.
//  Copyright © 2016年 Jeremy. All rights reserved.
//

#import "NSMutableArray+ImageArray.h"

@implementation NSMutableArray (ImageArray)

- (void) addDictObject {
    
    NSDictionary * dict1 = [NSDictionary dictionaryWithObject:@"lava" forKey:@"name"];
    NSDictionary * dict2 = [NSDictionary dictionaryWithObject:@"camping" forKey:@"name"];
    NSDictionary * dict3 = [NSDictionary dictionaryWithObject:@"cavern" forKey:@"name"];
    NSDictionary * dict4 = [NSDictionary dictionaryWithObject:@"findActivities" forKey:@"name"];
    NSDictionary * dict5 = [NSDictionary dictionaryWithObject:@"launch" forKey:@"name"];
    NSDictionary * dict6 = [NSDictionary dictionaryWithObject:@"pullingBoat" forKey:@"name"];
    NSDictionary * dict7 = [NSDictionary dictionaryWithObject:@"freeGuidePic" forKey:@"name"];
    NSDictionary * dict8 = [NSDictionary dictionaryWithObject:@"ridingPic" forKey:@"name"];
    NSDictionary * dict9 = [NSDictionary dictionaryWithObject:@"driftPic" forKey:@"name"];
    
    
    
    
    [self addObject:dict1];
    [self addObject:dict2];
    [self addObject:dict3];
    [self addObject:dict4];
    [self addObject:dict5];
    [self addObject:dict6];
    [self addObject:dict7];
    [self addObject:dict8];
    [self addObject:dict9];

}

@end
