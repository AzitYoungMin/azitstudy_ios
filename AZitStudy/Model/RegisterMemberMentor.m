//
//  RegisterMemberMentor.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 22..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "RegisterMemberMentor.h"

@implementation RegisterMemberMentor

- (NSMutableDictionary*)dictionaryObject
{
    NSMutableDictionary *dict = [super dictionaryObject];
    
    if( self.classYear )
        [dict setObject:self.classYear forKey:@"year"];
    
    return dict;
}

@end
