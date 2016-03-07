//
//  ResultInfo.h
//  NameUp
//
//  Created by coanyaa on 2015. 4. 21..
//  Copyright (c) 2015년 Joy2x. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModelBase.h"

enum ResultCodeEnum{
    ResultCode_Success = 0,
};

@class ListResultInfo;
@interface ResultInfo : ModelBase

@property (assign, nonatomic) BOOL isSuccess;
@property (strong, nonatomic) NSString *resultStr;
@property (strong, nonatomic) NSString *message;
@property (assign, nonatomic) BOOL isArray;
@property (strong, nonatomic) id jsonData;
@property (strong, nonatomic) NSString *textData;
@property (strong, nonatomic) id resultData;

@end
