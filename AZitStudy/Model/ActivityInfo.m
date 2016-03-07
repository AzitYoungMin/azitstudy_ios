//
//  ActivityInfo.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 27..
//  Copyright © 2016년 Joy2x. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "ActivityInfo.h"

@implementation ActivityInfo

- (UIImage*)activityIconImageWithType:(NSNumber*)typeId
{
    NSArray *array = @[
                       @"icon_a",
                       @"icon_b",
                       @"icon_c",
                       @"icon_d",
                       @"icon_e",
                       @"icon_f",
                       @"icon_g",
                       @"icon_h",
                       @"icon_i",
                       @"icon_j",
                       @"icon_k",
                       @"icon_l",
                       @"icon_m",
                       @"icon_n",
                       @"icon_o",
                       @"icon_p",
                       @"icon_q",
                       @"icon_r",
                       @"icon_s",
                       @"icon_t",
                       @"icon_u",
                       @"icon_v",
                       @"icon_w",
                       @"icon_x",
                       @"icon_y",
                       @"icon_z"
                       ];
    UIImage *image = nil;
    
    if( typeId ){
        NSInteger index = [typeId integerValue] - 1;
        if( index >= 0 && index < [array count] )
            image = [UIImage imageNamed:[array objectAtIndex:index]];
    }
    
    return image;
}

- (id)initWithData:(id)data
{
    self = [super initWithData:data];
    if( self ){
        self.idNumber = [data safeObjectForKey:@"id"];
        self.title = [data safeObjectForKey:@"title"];
        self.subTitle = [data safeObjectForKey:@"sub_title"];
        self.type = [data safeObjectForKey:@"activity_type"];
        self.goal = [data safeObjectForKey:@"goal"];
        self.typeId = [data safeObjectForKey:@"activity_type_id"];
        self.classification = [data safeObjectForKey:@"classification"];
        self.isRepeated = [[data safeObjectForKey:@"is_repeated"] boolValue];
        self.elapsedTime = 0.0;
    }
    
    return self;
}

- (NSMutableDictionary*)dictionaryObject
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    if( self.relationId )
        [dict setObject:self.relationId forKey:@"relation_id"];
    if( [self.goal length] > 0 )
        [dict setObject:self.goal forKey:@"goal"];
    [dict setObject:@(self.isRepeated) forKey:@"is_repeated"];
    if( [self.title length] > 0 )
        [dict setObject:self.title forKey:@"contents"];
    if( [self.classification length] > 0 )
        [dict setObject:self.classification forKey:@"classification"];
    
    return dict;
}

- (BOOL)isStudy
{
    return [[self.classification lowercaseString] isEqualToString:@"study"];
}

- (BOOL)isLecture
{
    return [[self.classification lowercaseString] isEqualToString:@"lecture"];
}

- (BOOL)isActivity
{
    return [[self.classification lowercaseString] isEqualToString:@"activity"];
}

@end
