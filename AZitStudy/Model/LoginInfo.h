//
//  LoginInfo.h
//  CaseByMe
//
//  Created by coanyaa on 2015. 12. 29..
//  Copyright © 2015년 Joy2x. All rights reserved.
//

#import "ModelBase.h"

@interface LoginInfo : ModelBase

@property (strong, nonatomic) NSString *typeId;
@property (strong, nonatomic) NSString *userId;
@property (strong, nonatomic) NSString *userSecret;
@property (assign, nonatomic) NSInteger memberType;
@property (strong, nonatomic) id profileInfo;

- (BOOL)isStudent;
- (BOOL)isTeacher;
- (BOOL)isMentor;

- (NSString*)userTypeString;

@end
