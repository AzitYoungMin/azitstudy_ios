//
//  SubjectGraphInfo.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 28..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "PieChartInfo.h"

@interface SubjectGraphInfo : ModelBase

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSMutableArray *itemArray;

- (id)initWithTitle:(NSString*)title items:(NSArray*)items;
@end
