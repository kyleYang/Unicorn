//
//  Address.m
//  unicorn
//
//  Created by Kyle on 14/11/2.
//  Copyright (c) 2014年 unicorn. All rights reserved.
//

#import "Address.h"


#define kLocal_address @"local_address"
#define kCity @"city"
#define kZip_code @"zip_code"
#define kState @"state"
#define kCountry @"country"


@interface Address(Unicorn)

@property (nonatomic, copy) NSString *local_address;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *zip_code;
@property (nonatomic, copy) NSString *state;
@property (nonatomic, copy) NSString *country;


@end



@implementation Address

- (NSString *)description
{
    return [NSString stringWithFormat:@"<Address local_address:%@, city:%@, zip_code:%@, state:%@, country:%@>",self.local_address,self.city,self.zip_code,self.state,self.country];
}




+ (Address *)parseObjectWithDictionary:(NSDictionary *)dictionary
{
    
    if (![dictionary isKindOfClass:[NSDictionary class]]) {
        
        NSLog(@"Error : Address parseObjectWithDeictionary dictionary:%@",dictionary);
        
        return nil;
    }
    
    Address *addrss = [[Address alloc] init];
    addrss.local_address = [dictionary objectForKey:kLocal_address];
    addrss.city = [dictionary objectForKey:kCity];
    addrss.zip_code = [dictionary objectForKey:kZip_code];
    addrss.state = [dictionary objectForKey:kState];
    addrss.country = [dictionary objectForKey:kCountry];
    return addrss;

}


@end
