//
//  Cuisine_Basic.h
//  unicorn
//
//  Created by Kyle on 14/11/2.
//  Copyright (c) 2014年 unicorn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cuisine_Basic : NSObject


@property (nonatomic, readonly) NSString *cuisine_description;

+ (Cuisine_Basic *)parseObjectWithDictionary:(NSDictionary *)dictionary;

@end
