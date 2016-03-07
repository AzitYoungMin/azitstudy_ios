//
//  TeacherProfileInfo.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 24..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "ProfileInfo.h"

@interface TeacherProfileInfo : ProfileInfo

@property (strong, nonatomic) NSString *lastSchool;
@property (assign, nonatomic) BOOL isGraduated;
@property (strong, nonatomic) NSString *instituteName;

@end
