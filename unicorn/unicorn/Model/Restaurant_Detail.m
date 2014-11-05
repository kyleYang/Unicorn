//
//  Restaurant_Detail.m
//  unicorn
//
//  Created by Kyle on 14/11/2.
//  Copyright (c) 2014年 unicorn. All rights reserved.
//

#import "Restaurant_Detail.h"


#define kImages @"images"
#define kAddress @"address"
#define kContact @"contact"

@interface Restaurant_Detail(Unicorn)


@property (nonatomic, strong) NSArray *images;
@property (nonatomic, strong) Address *address;
@property (nonatomic, copy) NSString *contact;

@end

@implementation Restaurant_Detail

- (NSString *)description
{
    return [NSString stringWithFormat:@"<Restaurant_Detail images:%@, address:%@, contact:%@>",self.images,self.address,self.contact];
}


+(NSArray *)parseCuisinesTypesWithArray:(NSArray *)array
{
    if (![array isKindOfClass:[NSArray class]]) {
        
        NSLog(@"Error : Restaurant_Detail parseImagesWithArray NSArray:%@",array);
        
        return nil;
    }
    
    NSMutableArray *types = [[NSMutableArray alloc] initWithCapacity:[array count]];
    [array enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *stop) {
        [types addObject:obj];
    }];
    
    return types;
    
}


+ (Restaurant_Detail *)parseObjectWithDictionary:(NSDictionary *)dictionary
{
    if (![dictionary isKindOfClass:[NSDictionary class]]) {
        
        NSLog(@"Error : Restaurant_Detail parseObjectWithDeictionary dictionary:%@",dictionary);
        
        return nil;
    }
    
    Restaurant_Detail *detail = [[Restaurant_Detail alloc] init];
    detail.images = [Restaurant_Detail parseCuisinesTypesWithArray:[dictionary objectForKey:kImages]];;
    detail.address = [Address parseObjectWithDictionary:[dictionary objectForKey:kAddress]];
    detail.contact = [dictionary objectForKey:kContact];
    return detail;
}




@end
