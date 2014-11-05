//
//  UnicornNetwork.m
//  unicorn
//
//  Created by Kyle on 14/11/2.
//  Copyright (c) 2014年 unicorn. All rights reserved.
//

#import "UnicornNetwork.h"


#define kHostURL @"http://54.68.133.142"

#define kCuisineSearchURL @"/v1/cuisines/search"
#define kRestaurantInfoURL @"v1/restaurants"
#define kRestaurantCuisinesURL @"v1/restaurants/cuisines"
#define kCusineDetailURL @"v1/cuisines/details"
#define kFavoriteCuisineURL @"v1/cuisines/favorite"

#define kSearch_cuisines @"search_cuisines"
#define kCuisines @"cuisines"
#define kNext_offset @"next_offset"

#define kRestaurant @"restaurant"

#define kArrayList @"ArrayList"

#define kCuisine_basic @"cuisine_basic"

#define kLong @"Long"

@interface UnicornNetwork()

@property (nonatomic, strong) AFHTTPRequestOperationManager *requestManager;

@end

@implementation UnicornNetwork
{
    AFHTTPRequestOperation *_searchOperation;
    AFHTTPRequestOperation *_infoOperation;
    AFHTTPRequestOperation *_cuisinesOperation;
    AFHTTPRequestOperation *_cuisineBasicOperation;
    AFHTTPRequestOperation *_favoriteOpreation;
}


static UnicornNetwork *network;
+(instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        network = [[self alloc] init];
    });
    
    return network;
}



- (instancetype)init
{
    if (self) {
        _requestManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:kHostURL]];
        _requestManager.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    
    return self;
}



-(void)searchCuisinesWithLocation:(CLLocation *)location sort_by:(NSString *)sort radius:(CGFloat)radius offset:(NSInteger)offset limit:(NSInteger)limit cuisine_category:(NSString *)cuisine_category cuisine_type:(NSString *)cuisine_type meal_type:(NSString *)meal_type serve_at_hour:(NSInteger)hour serachSuccess:(serachSuccess)success searchFail:(unicornFail)fail
{
    if (_searchOperation != nil) {
        
        
        return;
    }
    
    NSParameterAssert(location);
    NSParameterAssert(sort);

    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:10];
    [parameters setObject:@(location.coordinate.latitude) forKey:@"latitude"];
    [parameters setObject:@(location.coordinate.longitude) forKey:@"longitude"];
    [parameters setObject:sort forKey:@"sort_by"];
    [parameters setObject:@(radius) forKey:@"radius"];
    [parameters setObject:@(offset) forKey:@"offset"];
    [parameters setObject:@(limit) forKey:@"limit"];
    if (cuisine_category != nil) {
        [parameters setObject:cuisine_category forKey:@"cuisine_category"];
    }
    if (cuisine_type != nil) {
        [parameters setObject:cuisine_type forKey:@"cuisine_type"];
    }
    if (meal_type != nil) {
        [parameters setObject:meal_type forKey:@"meal_type"];
    }
    [parameters setObject:@(hour) forKey:@"serve_at_hour"];
   
    _searchOperation = [_requestManager GET:kCuisineSearchURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"searchCuisines operation:%@, responseObject:%@",operation,responseObject);
        _searchOperation = nil;
        
        NSDictionary *responseDictiony = (NSDictionary *)responseObject;
        NSDictionary *searchDictionary = [responseDictiony objectForKey:kSearch_cuisines];
        
        NSArray *cuisineArray = [Cuisines parseObjectArrayWithArray:[searchDictionary objectForKey:kCuisines]];
        NSInteger next = [[searchDictionary objectForKey:kNext_offset] integerValue];
        
        success(cuisineArray,next);
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        _searchOperation = nil;
        fail(-1,[error localizedDescription]);
        
    }];
    
    
}


- (void)restaurantsInfoWithRestaurantId:(NSString *)restaurant_id success:(restaurantSuccess)success fail:(unicornFail)fail
{
    if (_infoOperation != nil) {
        
        
        return;
    }
    
    NSParameterAssert(restaurant_id);
   
    
    NSDictionary *parameters = @{@"restaurant_id":restaurant_id};
    _infoOperation = [_requestManager GET:kRestaurantInfoURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"searchCuisines operation:%@, responseObject:%@",operation,responseObject);
        _infoOperation = nil;
        
        NSDictionary *responseDictiony = (NSDictionary *)responseObject;
        Restaurant *restaurant = [Restaurant parseObjectWithDictionary:[responseDictiony objectForKey:kRestaurant]];
        
        success(restaurant);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        _infoOperation = nil;
        fail(-1,[error localizedDescription]);
        
    }];

}


- (void)restaurantsCuisnesWithRestaurant_id:(NSString *)restaurant_id offset:(NSInteger)offset limit:(NSInteger)limit cuisine_category:(NSString *)cuisine_category cuisine_type:(NSString *)cuisine_type meal_type:(NSString *)meal_type serve_at_hour:(NSInteger)hour success:(restaurantCuisinesSuccess)success fail:(unicornFail)fail
{
    if (_cuisinesOperation != nil) {
        
        
        return;
    }
    
    NSParameterAssert(restaurant_id);
   
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:10];
   
    [parameters setObject:@(offset) forKey:@"offset"];
    [parameters setObject:@(limit) forKey:@"limit"];
    if (cuisine_category != nil) {
        [parameters setObject:cuisine_category forKey:@"cuisine_category"];
    }
    if (cuisine_type != nil) {
        [parameters setObject:cuisine_type forKey:@"cuisine_type"];
    }
    if (meal_type != nil) {
        [parameters setObject:meal_type forKey:@"meal_type"];
    }
    [parameters setObject:@(hour) forKey:@"serve_at_hour"];
    
    _cuisinesOperation = [_requestManager GET:kCuisineSearchURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"searchCuisines operation:%@, responseObject:%@",operation,responseObject);
        _cuisinesOperation = nil;
        
        NSDictionary *responseDictiony = (NSDictionary *)responseObject;
        NSArray *cuisinesArray = [Cuisine_Info parseObjectArrayWithArray:[responseDictiony objectForKey:kArrayList]];
        
        success(cuisinesArray);
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        _cuisinesOperation = nil;
        fail(-1,[error localizedDescription]);
        
    }];

}


- (void)getCuisineDetailWithCuisineId:(NSString *)cuisineId success:(cusineDetailSuccess)success fail:(unicornFail)fail
{
    if (_cuisineBasicOperation != nil) {
        
        
        return;
    }
    
    NSParameterAssert(cuisineId);
    
    
    NSDictionary *parameters = @{@"cuisine_id":cuisineId};
    _cuisineBasicOperation = [_requestManager GET:kCusineDetailURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"searchCuisines operation:%@, responseObject:%@",operation,responseObject);
        _cuisineBasicOperation = nil;
        
        NSDictionary *responseDictiony = (NSDictionary *)responseObject;
        Cuisine_Basic *baisc = [Cuisine_Basic parseObjectWithDictionary:[responseDictiony objectForKey:kCuisine_basic]];
        
        success(baisc);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        _cuisineBasicOperation = nil;
        fail(-1,[error localizedDescription]);
        
    }];
    

}


- (void)favoriteCuisineWidthCuisineId:(NSString *)cuisineId success:(favoriteSuccess)success fail:(unicornFail)fail
{
    if (_favoriteOpreation != nil) {
        
        
        return;
    }
    
    NSParameterAssert(cuisineId);
    
    
    NSDictionary *parameters = @{@"cuisine_id":cuisineId};
    _favoriteOpreation = [_requestManager GET:kFavoriteCuisineURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"searchCuisines operation:%@, responseObject:%@",operation,responseObject);
        _favoriteOpreation = nil;
        
        NSDictionary *responseDictiony = (NSDictionary *)responseObject;
        NSInteger number = [[responseDictiony objectForKey:kLong] integerValue];
        
        success(number);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        _favoriteOpreation = nil;
        fail(-1,[error localizedDescription]);
        
    }];

}




@end
