//
//  SolveAnswerInfo.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 28..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "ModelBase.h"

@interface SolveAnswerInfo : ModelBase

@property (strong, nonatomic) NSNumber *answerId;
@property (strong, nonatomic) NSString *article;
@property (strong, nonatomic) NSNumber *writerId;
@property (strong, nonatomic) NSString *writerName;
@property (strong, nonatomic) NSString *profileImage;
@property (strong, nonatomic) NSDate *createDate;
@property (assign, nonatomic) BOOL isChoosen;
@property (strong, nonatomic) NSNumber *score;
@property (strong, nonatomic) NSNumber *replyCount;

@end
