//
//  Cuisines.h
//  unicorn
//
//  Created by Kyle on 14/11/4.
//  Copyright (c) 2014年 unicorn. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Restaurant;

@interface Cuisines : NSObject

@property (nonatomic, readonly) Restaurant *restaurant;
@property (nonatomic, readonly) NSArray* restaurant_cuisines;

+ (Cuisines *)parseObjectWithDictionary:(NSDictionary *)dictionary;
+ (NSArray *)parseObjectArrayWithArray:(NSArray *)array;

@end
