//
//  Cuisine_Basic.m
//  unicorn
//
//  Created by Kyle on 14/11/2.
//  Copyright (c) 2014年 unicorn. All rights reserved.
//

#import "Cuisine_Basic.h"


#define kCuisine_description @"cuisine_description"

@interface Cuisine_Basic(Unicorn)


@property (nonatomic, copy) NSString *cuisine_description;

@end

@implementation Cuisine_Basic

- (NSString *)description
{
    return [NSString stringWithFormat:@"<Cuisine_Basic cuisine_description:%@>",self.cuisine_description];
}




+ (Cuisine_Basic *)parseObjectWithDictionary:(NSDictionary *)dictionary
{
    
    if (![dictionary isKindOfClass:[NSDictionary class]]) {
        
        NSLog(@"Error : Cuisine_Basic parseObjectWithDeictionary dictionary:%@",dictionary);
        
        return nil;
    }
    
    Cuisine_Basic *cuisine = [[Cuisine_Basic alloc] init];
    cuisine.cuisine_description = [dictionary objectForKey:kCuisine_description];
    return cuisine;
    
}


@end
