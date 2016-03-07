//
//  ListResultInfo.m
//  OurMarket
//
//  Created by coanyaa on 2014. 12. 30..
//  Copyright (c) 2014년 Joy2x. All rights reserved.
//

#import "ListResultInfo.h"


@implementation ListResultInfo

- (id)initWithData:(NSDictionary*)data itemClass:(Class)itemClass
{
    return [self initWithData:data itemClass:itemClass listKey:@"data"];
}

- (id)initWithData:(NSDictionary*)data itemClass:(Class)itemClass listKey:(NSString*)listKey
{
    self = [super initWithData:data];
    if( self) {
        self.totalCount = [[data safeObjectForKey:@"recordsTotal"] integerValue];
        self.offset = [[data safeObjectForKey:@"start"] integerValue];
        self.limit = [[data safeObjectForKey:@"length"] integerValue];
        
        id resultValue = [data safeObjectForKey:listKey];
        if( resultValue != nil && ( [resultValue isKindOfClass:[NSDictionary class]] || [resultValue isKindOfClass:[NSArray class]] ) ){
            NSArray *dataArray = nil;
            if( [resultValue isKindOfClass:[NSDictionary class]] ){
                dataArray = [NSArray arrayWithObject:resultValue];
            }
            else if( [resultValue isKindOfClass:[NSArray class]] ){
                dataArray = (NSArray*)resultValue;
            }
            
            self.itemArray = [self parseArrayResultForClass:itemClass withArray:dataArray];
        }
    }
    
    return self;
}

@end
