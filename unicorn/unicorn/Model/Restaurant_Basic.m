//
//  Restaurant_basic.m
//  unicorn
//
//  Created by Kyle on 14/11/2.
//  Copyright (c) 2014年 unicorn. All rights reserved.
//

#import "Restaurant_Basic.h"
#import <CoreLocation/CoreLocation.h>


#define kRestaurant_id @"restaurant_id"
#define kRestaurant_name @"restaurant_name"
#define kCuisines_types @"cuisines_types"
#define kThumbnail_image @"thumbnail_image"
#define kOpen_hour @"open_hour"
#define kLatitude @"latitude"
#define kLongitude @"longitude"

@interface Restaurant_Basic(Unicorn)

@property (nonatomic, copy) NSString *restaurant_id;
@property (nonatomic, copy) NSString *restaurant_name;
@property (nonatomic, strong) NSArray *cuisines_types;
@property (nonatomic, copy) NSString *thumbnail_image;
@property (nonatomic, copy) NSString *open_hour;
@property (nonatomic, assign) CLLocationDegrees latitude;
@property (nonatomic, assign) CLLocationDegrees longitude;

@end


@implementation Restaurant_Basic

- (NSString *)description
{
    return [NSString stringWithFormat:@"<Restaurant_Basic restaurant_id:%@, restaurant_name:%@, cuisines_types:%@, thumbnail_image:%@, open_hour:%@, latitude:%f, longitude:%f>",self.restaurant_id,self.restaurant_name,self.cuisines_types,self.thumbnail_image,self.open_hour,self.latitude,self.longitude];
}


+(NSArray *)parseCuisinesTypesWithArray:(NSArray *)array
{
    if (![array isKindOfClass:[NSArray class]]) {
        
        NSLog(@"Error : Restaurant_Basic parseCuisinesTypesWithArray NSArray:%@",array);
        
        return nil;
    }
    
    NSMutableArray *types = [[NSMutableArray alloc] initWithCapacity:[array count]];
    [array enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *stop) {
        [types addObject:obj];
    }];
    
    return types;
    
}

+ (Restaurant_Basic *)parseObjectWithDictionary:(NSDictionary *)dictionary
{
    if (![dictionary isKindOfClass:[NSDictionary class]]) {
        
        NSLog(@"Error : Restaurant_Basic parseObjectWithDeictionary dictionary:%@",dictionary);
        
        return nil;
    }
    
    Restaurant_Basic *basic = [[Restaurant_Basic alloc] init];
    basic.restaurant_id = [dictionary objectForKey:kRestaurant_id];
    basic.restaurant_name = [dictionary objectForKey:kRestaurant_name];
    basic.cuisines_types = [Restaurant_Basic parseCuisinesTypesWithArray:[dictionary objectForKey:kCuisines_types]];
    basic.thumbnail_image = [dictionary objectForKey:kThumbnail_image];
    basic.open_hour = [dictionary objectForKey:kOpen_hour];
    basic.latitude = [[dictionary objectForKey:kLatitude] doubleValue];
    basic.longitude = [[dictionary objectForKey:kLatitude] doubleValue];
    return basic;
}


@end
