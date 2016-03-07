//
//  ImageInfo.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 28..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "ImageInfo.h"

@implementation ImageInfo
- (id)initWithData:(id)data
{
    self = [super initWithData:data];
    if( self ){
        self.imageId = [data safeObjectForKey:@"id"];
        self.imageUrl = [data safeObjectForKey:@"image_url"];
    }
    
    return self;
}
@end
