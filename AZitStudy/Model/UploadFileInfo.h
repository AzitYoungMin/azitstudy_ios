//
//  UploadFileInfo.h
//  dingdong
//
//  Created by coanyaa on 2015. 6. 17..
//  Copyright (c) 2015년 Timesystem. All rights reserved.
//

#import "ModelBase.h"

@interface UploadFileInfo : ModelBase

@property (strong, nonatomic) NSData *fileData;
@property (strong, nonatomic) NSString *fileName;
@property (strong, nonatomic) NSString *key;
@property (strong, nonatomic) NSString *mimeType;

- (id)initWithFileData:(NSData*)data key:(NSString*)key filename:(NSString*)filename mimeType:(NSString*)mimeType;
@end
