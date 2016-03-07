//
//  RegisterMemberStudent.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 22..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "RegisterMemberStudent.h"

@implementation RegisterMemberStudent

- (NSMutableDictionary*)dictionaryObject
{
    NSMutableDictionary *dict = [super dictionaryObject];
    
    if( self.classYear )
        [dict setObject:self.classYear forKey:@"year"];
    if( self.department )
        [dict setObject:self.department forKey:@"department"];
    if( self.mathType )
        [dict setObject:self.mathType forKey:@"math_type"];
    if( self.foreignLanguage )
        [dict setObject:self.foreignLanguage forKey:@"foreign_language"];
    if( [self.optionalSubjects length] > 0 )
        [dict setObject:self.optionalSubjects forKey:@"optional_subjects"];
    if( [self.targetDepartments count] > 0 )
        [dict setObject:[self.targetDepartments componentsJoinedByString:@","] forKey:@"target_departments"];
    if( [self.parentName length] > 0 )
        [dict setObject:self.parentName forKey:@"parent_name"];
    if( [self.parentPhone length] > 0 )
        [dict setObject:self.parentPhone forKey:@"parent_phone"];
    if( self.isMpEducation )
        [dict setObject:self.isMpEducation forKey:@"mp_education"];
    
    return dict;
}
@end
