//
//  ActivityInfo.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 27..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "ModelBase.h"

@interface ActivityInfo : ModelBase

@property (strong, nonatomic) NSNumber *idNumber;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *subTitle;
@property (strong, nonatomic) NSNumber *type;
@property (strong, nonatomic) NSString *goal;
@property (strong, nonatomic) NSString *classification;
@property (assign, nonatomic) BOOL isRepeated;
@property (strong, nonatomic) NSNumber *typeId;
@property (strong, nonatomic) NSDate *regDate;
@property (strong, nonatomic) NSDate *startTime;
@property (assign, nonatomic) NSTimeInterval elapsedTime;
@property (strong, nonatomic) NSNumber *relationId;

- (UIImage*)activityIconImageWithType:(NSNumber*)typeId;
- (BOOL)isStudy;
- (BOOL)isLecture;
- (BOOL)isActivity;

@end
