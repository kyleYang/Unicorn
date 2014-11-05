//
//  UnicornNetwork.h
//  unicorn
//
//  Created by Kyle on 14/11/2.
//  Copyright (c) 2014年 unicorn. All rights reserved.
//

#import "AFNetworking.h"
#import <CoreLocation/CoreLocation.h>
#import "UnicornModel.h"

typedef void(^serachSuccess)(NSArray *searchArray, NSInteger nextOffset);
typedef void(^restaurantSuccess)(Restaurant *restaurant);
typedef void(^restaurantCuisinesSuccess)(NSArray *cuisinesArray);
typedef void(^cusineDetailSuccess)(Cuisine_Basic *basic);
typedef void(^favoriteSuccess)(NSInteger favoriteNum);
typedef void(^unicornFail)(NSInteger failcode,NSString *failMsg);

@interface UnicornNetwork : NSObject

+(instancetype)shareInstance;


/**
 *  Search Cuisines
 
 @REQUIRED PARAMETERS:
 *
 *  @param location         geographic coordinate
 *  @param sort             sorting criteria (distance or popularity)
 
 @OPTIONAL PARAMETERS:
 
 *  @param radius           Search radius in meters. (0 - 8000)
 *  @param offset           starting offset
 *  @param limit            limit the number of results (0 - 100)
 *  @param cuisine_category cuisine category to filter search reslts with.(Chinese, FastFood, French, Italian, Japaness, Korean, Mexican, Sandwich, Thai, etc.)
 *  @param cuisine_type     meal_type category to filter search results with.(Appetizer, Beer, Beverage, Dessert, Entree, Snacks, Wine, etc.)
 *  @param meal_type        meal_type to filter search results with.(Breakfast, Brunch, Lunch, HappyHour, Dinner, etc.)
 *  @param hour             serve_at_local_hour to filter search results with.( 0-23)
 
 @return
 
 *  @param success          Success callback ,retun a NSArray ,that is Cuisines, nextOffset:load more offset, when have no more = -1
 *  @param fail             Fail Message ,include failCode and failMsg
 */

-(void)searchCuisinesWithLocation:(CLLocation *)location sort_by:(NSString *)sort radius:(CGFloat)radius offset:(NSInteger)offset limit:(NSInteger)limit cuisine_category:(NSString *)cuisine_category cuisine_type:(NSString *)cuisine_type meal_type:(NSString *)meal_type serve_at_hour:(NSInteger)hour serachSuccess:(serachSuccess)success searchFail:(unicornFail)fail;




/**
 *  Get restaurant info Request
 *
  @REQUIRED PARAMETERS:
 *  @param restaurant_id restaurant id
 
 @return
 
 *  @param success       restaurant info , include restaurant_basic andrestaurant_detail
 *  @param fail          Fail Message ,include failCode and failMsg
 */
- (void)restaurantsInfoWithRestaurantId:(NSString *)restaurant_id success:(restaurantSuccess)success fail:(unicornFail)fail;


/**
 *  Get cuisines for restaurant
 *
 
 @REQUIRED PARAMETERS:
 
 *  @param restaurant_id    restaurant
 
 @OPTIONAL PARAMETERS:
 
 *  @param offset           starting offset
 *  @param limit            limit the number of results (0 - 100)
 *  @param cuisine_category cuisine category to filter search reslts with.(Chinese, FastFood, French, Italian, Japaness, Korean, Mexican, Sandwich, Thai, etc.)
 *  @param cuisine_type     meal_type category to filter search results with.(Appetizer, Beer, Beverage, Dessert, Entree, Snacks, Wine, etc.)
 *  @param meal_type        meal_type to filter search results with.(Breakfast, Brunch, Lunch, HappyHour, Dinner, etc.)
 *  @param hour             serve_at_local_hour to filter search results with.( 0-23) *  @param success       
 
 @return
 
 *  @param success          Success callback ,retun a NSArray ,that is Cuisine_Info
 *  @param fail             Fail Message ,include failCode and failMsg

 */

- (void)restaurantsCuisnesWithRestaurant_id:(NSString *)restaurant_id offset:(NSInteger)offset limit:(NSInteger)limit cuisine_category:(NSString *)cuisine_category cuisine_type:(NSString *)cuisine_type meal_type:(NSString *)meal_type serve_at_hour:(NSInteger)hour success:(restaurantCuisinesSuccess)success fail:(unicornFail)fail;

/**
 *
 *  Get cuisine details
 *
 
  @REQUIRED PARAMETERS:
 
 *  @param cuisineId cuisine_id
 
 @return
 *  @param success   Cuisine_Basic info
 *  @param fail      Fail Message ,include failCode and failMsg
 */


- (void)getCuisineDetailWithCuisineId:(NSString *)cuisineId success:(cusineDetailSuccess)success fail:(unicornFail)fail;


/**
 *  Favorite cuisine
 *
 
 @REQUIRED PARAMETERS:
 
 *  @param cuisineId cuisine_id
 
 @return
 *  @param success   current favorite number
 *  @param fail      Fail Message ,include failCode and failMsg
 */
- (void)favoriteCuisineWidthCuisineId:(NSString *)cuisineId success:(favoriteSuccess)success fail:(unicornFail)fail;


@end
