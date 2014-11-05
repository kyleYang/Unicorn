//
//  Restaurant.m
//  unicorn
//
//  Created by Kyle on 14/11/2.
//  Copyright (c) 2014年 unicorn. All rights reserved.
//

#import "Restaurant.h"


#define kRestaurant_Basic @"restaurant_Basic"
#define kRestaurant_Detail @"restaurant_Detail"
#define kDistance @"distance"

@interface Restaurant(Unicorn)

@property (nonatomic, strong) Restaurant_Basic *basic;
@property (nonatomic, strong) Restaurant_Detail *detail;
@property (nonatomic, assign) CGFloat distance;
@end

@implementation Restaurant

- (NSString *)description
{
    return [NSString stringWithFormat:@"<Restaurant restaurant_Basic:%@, restaurant_Detail:%@, distance:%f",self.basic,self.detail,self.distance];
}

+ (Restaurant *)parseObjectWithDictionary:(NSDictionary *)dictionary
{
    
    if (![dictionary isKindOfClass:[NSDictionary class]]) {
        
        NSLog(@"Error : Restaurant parseObjectWithDeictionary dictionary:%@",dictionary);
        
        return nil;
    }
    
    Restaurant *restaurant = [[Restaurant alloc] init];
    restaurant.basic = [Restaurant_Basic parseObjectWithDictionary:[dictionary objectForKey:kRestaurant_Basic]];
    restaurant.detail =[Restaurant_Detail parseObjectWithDictionary:[dictionary objectForKey:kRestaurant_Detail]];
    restaurant.distance = [[dictionary objectForKey:kDistance] floatValue];
    return restaurant;
    
}



@end
