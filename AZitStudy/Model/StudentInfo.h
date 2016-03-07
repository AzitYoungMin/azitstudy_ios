//
//  StudentInfo.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 24..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "ModelBase.h"

@interface StudentInfo : ModelBase

@property (strong, nonatomic) NSNumber *studentId;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *profileImage;
@property (strong, nonatomic) NSArray *goalAchieves;
@property (strong, nonatomic) NSMutableArray *examArray;


@end
