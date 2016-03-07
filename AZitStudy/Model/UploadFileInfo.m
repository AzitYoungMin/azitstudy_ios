//
//  UploadFileInfo.m
//  dingdong
//
//  Created by coanyaa on 2015. 6. 17..
//  Copyright (c) 2015년 Timesystem. All rights reserved.
//

#import "UploadFileInfo.h"

@implementation UploadFileInfo

- (id)initWithFileData:(NSData*)data key:(NSString*)key filename:(NSString*)filename mimeType:(NSString*)mimeType
{
    self = [super init];
    if( self ){
        self.fileData = data;
        self.fileName = filename;
        self.key = key;
        self.mimeType = mimeType;
    }
    return self;
}

@end
