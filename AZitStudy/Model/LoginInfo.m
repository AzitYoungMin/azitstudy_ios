//
//  LoginInfo.m
//  CaseByMe
//
//  Created by coanyaa on 2015. 12. 29..
//  Copyright © 2015년 Joy2x. All rights reserved.
//

#import <CocoaSecurity.h>
#import "LoginInfo.h"
#import "Common.h"

@implementation LoginInfo

- (id)initWithData:(id)data
{
    self = [super initWithData:data];
    if( self ){
        self.typeId = [data safeObjectForKey:@"type_id"];
        self.userId = [data safeObjectForKey:@"user_id"];
        self.userSecret = [data safeObjectForKey:@"secret"];
        self.memberType = [self.typeId integerValue];
    }
    
    return self;
}

- (BOOL)isStudent
{
    return (self.memberType == MemberType_Student);
}

- (BOOL)isTeacher
{
    return (self.memberType == MemberType_Teacher);
}

- (BOOL)isMentor
{
    return (self.memberType == MemberType_Mentor);
}

- (NSString*)userTypeString
{
    NSString *retStr = @"";
    
    switch (self.memberType) {
        case MemberType_Mentor:
            retStr = @"멘토";
            break;
        case MemberType_Student:
            retStr = @"학생";
            break;
        case MemberType_Teacher:
            retStr = @"선생님";
            break;
    }
    
    return retStr;
}
@end
