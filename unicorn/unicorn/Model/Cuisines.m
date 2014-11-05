//
//  Cuisines.m
//  unicorn
//
//  Created by Kyle on 14/11/4.
//  Copyright (c) 2014年 unicorn. All rights reserved.
//

#import "Cuisines.h"
#import "Restaurant.h"
#import "Cuisine_Info.h"

#define kRestaurant @"restaurant"
#define kRestaurant_cuisines @"restaurant_cuisines"



@interface Cuisines(Unicorn)

@property (nonatomic, strong) Restaurant *restaurant;
@property (nonatomic, strong) NSArray* restaurant_cuisines;



@end



@implementation Cuisines

- (NSString *)description
{
    return [NSString stringWithFormat:@"<Cuisines restaurant:%@, restaurant_cuisines:%@>",self.restaurant,self.restaurant_cuisines];
}




+ (Cuisines *)parseObjectWithDictionary:(NSDictionary *)dictionary
{
    
    if (![dictionary isKindOfClass:[NSDictionary class]]) {
        
        NSLog(@"Error : Cuisines parseObjectWithDeictionary dictionary:%@",dictionary);
        
        return nil;
    }
    
    Cuisines *cuisines = [[Cuisines alloc] init];
    cuisines.restaurant = [Restaurant parseObjectWithDictionary:[dictionary objectForKey:kRestaurant]];
    cuisines.restaurant_cuisines = [Cuisine_Info parseObjectArrayWithArray:[dictionary objectForKey:kRestaurant_cuisines]];
    
    return cuisines;
    
}



+ (NSArray *)parseObjectArrayWithArray:(NSArray *)array
{
    
    if (![array isKindOfClass:[NSArray class]]) {
        
        NSLog(@"Error : Cuisines parseObjectArrayWithArray NSArray:%@",array);
        
        return nil;
    }
    
    NSMutableArray *resultes = [NSMutableArray arrayWithCapacity:[array count]];
    
    [array enumerateObjectsUsingBlock:^(NSDictionary *dictionary, NSUInteger idx, BOOL *stop) {
        Cuisines *cuisine = [Cuisines parseObjectWithDictionary:dictionary];
        if (cuisine != nil) {
            [resultes addObject:cuisine];
        }
        
    }];
    
    return resultes;
}



@end
