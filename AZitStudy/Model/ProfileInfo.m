//
//  ProfileInfo.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 24..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "ProfileInfo.h"
#import "Common.h"

@implementation ProfileInfo

- (id)initWithData:(id)data
{
    self = [super initWithData:data];
    if( self ){
        self.name = [data safeObjectForKey:@"name"];
        self.gender = [data safeObjectForKey:@"gender"];
        self.profileImage = [data safeObjectForKey:@"profile_image"];
        self.introduce = [data safeObjectForKey:@"introduce"];
        self.targetUniversity = [data safeObjectForKey:@"target_university"];
        self.email = [data safeObjectForKey:@"email"];
        self.nickname = [data safeObjectForKey:@"nickname"];
        self.phoneNumber = [data safeObjectForKey:@"phone"];
        self.hasNewAnswer = StringToBOOL([data safeObjectForKey:@"has_new_answer"]);
        self.hasNewMessage = StringToBOOL([data safeObjectForKey:@"has_new_message"]);
        self.classYear = [data safeObjectForKey:@"year"];
    }
    
    return self;
}

@end
