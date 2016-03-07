//
//  RegisterMemberStudent.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 22..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "RegisterMemberBaseInfo.h"

@interface RegisterMemberStudent : RegisterMemberBaseInfo

@property (strong, nonatomic) NSNumber *classYear;
@property (strong, nonatomic) NSNumber *department;
@property (strong, nonatomic) NSNumber *mathType;
@property (strong, nonatomic) NSNumber *foreignLanguage;
@property (strong, nonatomic) NSString *optionalSubjects;
@property (strong, nonatomic) NSMutableArray *targetDepartments;
@property (strong, nonatomic) NSString *parentName;
@property (strong, nonatomic) NSString *parentPhone;
@property (strong, nonatomic) NSNumber *isMpEducation;

@end
