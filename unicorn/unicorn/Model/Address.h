//
//  Address.h
//  unicorn
//
//  Created by Kyle on 14/11/2.
//  Copyright (c) 2014年 unicorn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Address : NSObject

@property (nonatomic, readonly) NSString *local_address;
@property (nonatomic, readonly) NSString *city;
@property (nonatomic, readonly) NSString *zip_code;
@property (nonatomic, readonly) NSString *state;
@property (nonatomic, readonly) NSString *country;

+ (Address *)parseObjectWithDictionary:(NSDictionary *)dictionary;

@end
