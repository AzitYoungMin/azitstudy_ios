//
//  SubjectPieCartInfo.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 28..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "PieChartInfo.h"

@interface SubjectPieCartInfo : PieChartInfo

@property (strong, nonatomic) NSString *title;
@property (assign, nonatomic) NSTimeInterval time;

- (id)initWithRate:(float)rate color:(UIColor *)color title:(NSString*)title time:(NSTimeInterval)time;

@end
