//
//  RegisterMemberTeacher.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 22..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "RegisterMemberBaseInfo.h"

@interface RegisterMemberTeacher : RegisterMemberBaseInfo

@property (strong, nonatomic) NSString *classification;
@property (strong, nonatomic) NSString *birthday;
@property (strong, nonatomic) NSString *lastSchool;
@property (strong, nonatomic) NSString *isGraduated;

@end
