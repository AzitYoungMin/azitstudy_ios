//
//  SelectItemInfo.h
//
//  Created by coanyaa on 2015. 6. 14..
//  Copyright (c) 2015년 Joy2x. All rights reserved.
//

#import "ModelBase.h"

@interface SelectItemInfo : ModelBase

@property (strong, nonatomic) NSString *title;
@property (assign, nonatomic) BOOL selected;
@property (assign, nonatomic) BOOL disabled;
@property (assign, nonatomic) NSInteger type;
@property (strong, nonatomic) id objectTag;

- (id)initWithTitle:(NSString*)title selected:(BOOL)selected;
- (id)initWithTitle:(NSString*)title selected:(BOOL)selected type:(NSInteger)type;
- (id)initWithTitle:(NSString*)title selected:(BOOL)selected type:(NSInteger)type tag:(id)tag;
- (id)initWithTitle:(NSString*)title selected:(BOOL)selected disabled:(BOOL)disabled type:(NSInteger)type tag:(id)tag;

@end
