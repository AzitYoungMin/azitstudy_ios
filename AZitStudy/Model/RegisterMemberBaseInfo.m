//
//  RegisterMemberBaseInfo.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 22..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "RegisterMemberBaseInfo.h"

@implementation RegisterMemberBaseInfo

- (NSMutableDictionary*)dictionaryObject
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    if( [self.email length] > 0 )
        [dict setObject:self.email forKey:@"email"];
    if( [self.password length] > 0 )
        [dict setObject:self.password forKey:@"password"];
    if( [self.name length] > 0 )
        [dict setObject:self.name forKey:@"name"];
    if( [self.nickname length] > 0 )
        [dict setObject:self.nickname forKey:@"nickname"];
    if( [self.phoneNumber length] > 0 )
        [dict setObject:self.phoneNumber forKey:@"phone"];
    if( [self.gender length] > 0 )
        [dict setObject:self.gender forKey:@"gender"];
    if( [self.educationPlaceId length] > 0 )
        [dict setObject:self.educationPlaceId forKey:@"edu_inst_id"];
    
    return dict;
}
@end
