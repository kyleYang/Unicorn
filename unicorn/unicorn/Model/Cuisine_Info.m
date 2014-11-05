//
//  Cuisine_Info.m
//  unicorn
//
//  Created by Kyle on 14/11/2.
//  Copyright (c) 2014年 unicorn. All rights reserved.
//

#import "Cuisine_Info.h"

#define kCuisine_id @"cuisine_id"
#define kCuisine_name @"cuisine_name"
#define kDisplay_image @"display_image"
#define kPrice @"price"
#define kFavorites @"favorites"


@interface Cuisine_Info(Unicorn)

@property (nonatomic, copy) NSString *cuisine_id;
@property (nonatomic, copy) NSString *cuisine_name;
@property (nonatomic, copy) NSString *display_image;
@property (nonatomic, assign) CGFloat price;
@property (nonatomic, assign) NSUInteger favorites;



@end

@implementation Cuisine_Info


- (NSString *)description
{
    return [NSString stringWithFormat:@"<Cuisine_Info cuisine_id:%@, cuisine_name:%@, display_image:%@, price:%.2f, favorites:%ld>",self.cuisine_id,self.cuisine_name,self.display_image,self.price,self.favorites];
}




+ (Cuisine_Info *)parseObjectWithDictionary:(NSDictionary *)dictionary
{
    
    if (![dictionary isKindOfClass:[NSDictionary class]]) {
        
        NSLog(@"Error : Cuisine_Info parseObjectWithDeictionary dictionary:%@",dictionary);
        
        return nil;
    }
    
    Cuisine_Info *cuisine = [[Cuisine_Info alloc] init];
    cuisine.cuisine_id = [dictionary objectForKey:kCuisine_id];
    cuisine.cuisine_name = [dictionary objectForKey:kCuisine_name];
    cuisine.display_image = [dictionary objectForKey:kDisplay_image];
    cuisine.price = [[dictionary objectForKey:kPrice] floatValue];
    cuisine.favorites = [[dictionary objectForKey:kFavorites] integerValue];
    return cuisine;
    
}

+ (NSArray *)parseObjectArrayWithArray:(NSArray *)array
{
    
    if (![array isKindOfClass:[NSArray class]]) {
        
        NSLog(@"Error : Cuisine_Info parseObjectArrayWithArray NSArray:%@",array);
        
        return nil;
    }
    
    NSMutableArray *resultes = [NSMutableArray arrayWithCapacity:[array count]];
    
    [array enumerateObjectsUsingBlock:^(NSDictionary *dictionary, NSUInteger idx, BOOL *stop) {
        Cuisine_Info *cuisine = [Cuisine_Info parseObjectWithDictionary:dictionary];
        if (cuisine != nil) {
            [resultes addObject:cuisine];
        }
        
    }];
    
    return resultes;
}



@end
