//
//  Restaurant.h
//  unicorn
//
//  Created by Kyle on 14/11/2.
//  Copyright (c) 2014年 unicorn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Restaurant_Basic.h"
#import "Restaurant_Detail.h"


@interface Restaurant : NSObject


@property (nonatomic, readonly) Restaurant_Basic *basic;
@property (nonatomic, readonly) Restaurant_Detail *detail;
@property (nonatomic, readonly) CGFloat distance;


+ (Restaurant *)parseObjectWithDictionary:(NSDictionary *)dictionary;

@end
