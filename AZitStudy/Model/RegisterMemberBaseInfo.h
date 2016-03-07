//
//  RegisterMemberBaseInfo.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 22..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "ModelBase.h"

@interface RegisterMemberBaseInfo : ModelBase

@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *password;
@property (strong, nonatomic) NSString *confirmPassword;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *nickname;
@property (strong, nonatomic) NSString *phoneNumber;
@property (strong, nonatomic) NSString *gender;
@property (strong, nonatomic) NSString *educationPlaceId;

@end
