//
//  ResultInfo.m
//  NameUp
//
//  Created by coanyaa on 2015. 4. 21..
//  Copyright (c) 2015년 Joy2x. All rights reserved.
//

#import "ResultInfo.h"
#import "NSDictionary+SafeParseData.h"
#import "ModelBase.h"
#import "ListResultInfo.h"

@implementation ResultInfo

- (id)initWithData:(id)data
{
    self = [super init];
    if( self ){
        NSError *error = nil;
        self.textData = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        if( error == nil ){
            self.resultStr = [json safeObjectForKey:@"result"];
            self.isSuccess = [[self.resultStr lowercaseString] isEqualToString:@"success"];
            self.message = [json safeObjectForKey:@"message"];
            self.jsonData = json;
            self.isArray = [json isKindOfClass:[NSArray class]];
            self.resultData = json;
        }
        else{
//            self.isSuccess = [[self.textData lowercaseString] isEqualToString:@"true"];
            self.resultData = self.textData;
        }
        
        
    }
    
    return self;
}

@end
