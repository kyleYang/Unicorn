//
//  Restaurant_basic.h
//  unicorn
//
//  Created by Kyle on 14/11/2.
//  Copyright (c) 2014年 unicorn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface Restaurant_Basic : NSObject

@property (nonatomic, readonly) NSString *restaurant_id;
@property (nonatomic, readonly) NSString *restaurant_name;
@property (nonatomic, readonly) NSArray *cuisines_types;  // Array like @[@"APPETIZER",@"DIM SUM",@"ENTREE"]
@property (nonatomic, readonly) NSString *thumbnail_image;
@property (nonatomic, readonly) NSString *open_hour;
@property (nonatomic, readonly) CLLocationDegrees latitude;
@property (nonatomic, readonly) CLLocationDegrees longitude;


+ (Restaurant_Basic *)parseObjectWithDictionary:(NSDictionary *)dictionary;


@end
