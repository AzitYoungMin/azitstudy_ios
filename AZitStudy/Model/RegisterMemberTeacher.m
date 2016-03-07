//
//  RegisterMemberTeacher.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 22..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "RegisterMemberTeacher.h"

@implementation RegisterMemberTeacher

- (NSMutableDictionary*)dictionaryObject
{
    NSMutableDictionary *dict = [super dictionaryObject];
    
    if( [self.classification length] > 0 )
        [dict setObject:self.classification forKey:@"classification"];
    if( [self.birthday length] > 0 )
        [dict setObject:self.birthday forKey:@"birthday"];
    if( [self.lastSchool length] > 0 )
        [dict setObject:self.lastSchool forKey:@"last_school"];
    if( [self.isGraduated length] > 0 )
        [dict setObject:self.isGraduated forKey:@"is_graduated"];
    
    return dict;
}

@end
