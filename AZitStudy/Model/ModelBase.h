//
//  ModelBase.h
//
//  Created by coanyaa on 2015. 6. 12..
//  Copyright (c) 2015년 Joy2x. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDictionary+SafeParseData.h"
#import "NSNumber+Formatter.h"

#define DEFAULT_DATETIMEFORMAT              @"yyyy-MM-dd'T'HH:mm:ss"

@interface ModelBase : NSObject


@property (assign, nonatomic) BOOL selected;

- (id)initWithData:(id)data;
- (id)parseResultForClass:(Class)modelClass withData:(id)data;
- (NSMutableArray*)parseArrayResultForClass:(Class)modelClass withArray:(NSArray*)array;
- (NSMutableDictionary*)dictionaryObject;
- (void)copyFrom:(id)target;

@end
