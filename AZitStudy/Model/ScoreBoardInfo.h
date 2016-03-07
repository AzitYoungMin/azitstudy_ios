//
//  ScoreBoardInfo.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 29..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "ModelBase.h"

@interface ScoreBoardInfo : ModelBase

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSMutableArray *monthArray;
@property (strong, nonatomic) NSMutableArray *averageScoreArray;
@property (strong, nonatomic) NSMutableArray *originalScoreArray;
@property (strong, nonatomic) NSMutableArray *gradeArray;

- (id)initWithTitle:(NSString*)title;

@end
