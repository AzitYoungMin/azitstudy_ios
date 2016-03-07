//
//  PercentChartInfo.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 29..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "ModelBase.h"

@interface BarChartItemInfo : ModelBase

@property (assign, nonatomic) float value;
@property (strong, nonatomic) NSString *title;

- (id)initWithValue:(float)value title:(NSString*)title;

@end

@interface PercentChartInfo : ModelBase

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSMutableArray *itemArray;

- (id)initWithTitle:(NSString*)title items:(NSArray*)items;

@end
