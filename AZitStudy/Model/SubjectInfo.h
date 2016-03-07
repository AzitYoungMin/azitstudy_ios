//
//  SubjectInfo.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 28..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "ModelBase.h"

@interface SubjectInfo : ModelBase

@property (strong, nonatomic) NSString *subject;
@property (assign, nonatomic) NSTimeInterval studyTime;
@property (strong, nonatomic) NSNumber *topRanking;
@property (strong, nonatomic) NSMutableArray *graphInfoArray;

- (id)initWithSubject:(NSString*)subject time:(NSTimeInterval)time ranking:(NSNumber*)ranking;

@end
