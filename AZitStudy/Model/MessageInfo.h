//
//  MessageInfo.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 24..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "ModelBase.h"

@interface MessageInfo : ModelBase

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *message;
@property (strong, nonatomic) NSString *senderName;
@property (strong, nonatomic) NSDate *regDate;

@end
