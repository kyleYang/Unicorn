//
//  Restaurant_Detail.h
//  unicorn
//
//  Created by Kyle on 14/11/2.
//  Copyright (c) 2014年 unicorn. All rights reserved.
//


#import "Address.h"

@interface Restaurant_Detail : NSObject

@property (nonatomic, readonly) NSArray *images;
@property (nonatomic, readonly) Address *address;
@property (nonatomic, readonly) NSString *contact;

+ (Restaurant_Detail *)parseObjectWithDictionary:(NSDictionary *)dictionary;

@end
