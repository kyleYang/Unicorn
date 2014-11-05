//
//  Cuisine_Info.h
//  unicorn
//
//  Created by Kyle on 14/11/2.
//  Copyright (c) 2014年 unicorn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Cuisine_Info : NSObject

@property (nonatomic, readonly) NSString *cuisine_id;
@property (nonatomic, readonly) NSString *cuisine_name;
@property (nonatomic, readonly) NSString *display_image;
@property (nonatomic, readonly) CGFloat price;
@property (nonatomic, readonly) NSUInteger favorites;

+ (Cuisine_Info *)parseObjectWithDictionary:(NSDictionary *)dictionary;
+ (NSArray *)parseObjectArrayWithArray:(NSArray *)array;


@end
