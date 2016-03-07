//
//  SelectItemInfo.m
//
//  Created by coanyaa on 2015. 6. 14..
//  Copyright (c) 2015년 Joy2x. All rights reserved.
//

#import "SelectItemInfo.h"

@implementation SelectItemInfo

- (id)initWithData:(NSDictionary *)data
{
    self = [super initWithData:data];
    if( self ){
        self.title = [data safeObjectForKey:@"title"];
        self.selected = [[data safeObjectForKey:@"selected"] boolValue];
        self.type = [[data safeObjectForKey:@"type"] integerValue];
    }
    
    return self;
}

- (id)initWithTitle:(NSString*)title selected:(BOOL)selected
{
    self = [super init];
    if( self ){
        self.title = title;
        self.selected = selected;
    }
    return self;
}

- (id)initWithTitle:(NSString*)title selected:(BOOL)selected type:(NSInteger)type
{
    self = [super init];
    if( self ){
        self.title = title;
        self.selected = selected;
        self.type = type;
    }
    return self;
}

- (id)initWithTitle:(NSString*)title selected:(BOOL)selected type:(NSInteger)type tag:(id)tag
{
    self = [super init];
    if( self ){
        self.title = title;
        self.selected = selected;
        self.type = type;
        self.objectTag = tag;
    }
    return self;
}

- (id)initWithTitle:(NSString*)title selected:(BOOL)selected disabled:(BOOL)disabled type:(NSInteger)type tag:(id)tag
{
    self = [super init];
    if( self ){
        self.title = title;
        self.selected = selected;
        self.disabled = disabled;
        self.type = type;
        self.objectTag = tag;
    }
    return self;
}

@end
