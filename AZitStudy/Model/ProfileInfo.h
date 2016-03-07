//
//  ProfileInfo.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 24..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "ModelBase.h"

@interface ProfileInfo : ModelBase

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *gender;
@property (strong, nonatomic) NSString *profileImage;
@property (strong, nonatomic) NSString *introduce;
@property (strong, nonatomic) NSString *targetUniversity;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *nickname;
@property (strong, nonatomic) NSString *phoneNumber;
@property (assign, nonatomic) BOOL hasNewAnswer;
@property (assign, nonatomic) BOOL hasNewMessage;
@property (strong, nonatomic) NSString *classYear;

@end
