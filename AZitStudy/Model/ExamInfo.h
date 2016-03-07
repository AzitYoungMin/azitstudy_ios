//
//  ExamInfo.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 28..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "ModelBase.h"

@interface ExamInfo : ModelBase
@property (strong, nonatomic) NSNumber *examId;
@property (strong, nonatomic) NSString *title;
@property (assign, nonatomic) BOOL hasScore;

@end
