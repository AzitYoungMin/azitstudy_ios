//
//  TeacherProfileInfo.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 24..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "TeacherProfileInfo.h"
#import "Common.h"

@implementation TeacherProfileInfo

- (id)initWithData:(id)data
{
    self = [super initWithData:data];
    if( self ){
        self.lastSchool = [data safeObjectForKey:@"last_school"];
        self.isGraduated = StringToBOOL([data safeObjectForKey:@"is_graduated"]);
        self.instituteName = [data safeObjectForKey:@"edu_inst"];
    }
    
    return self;
}
@end
