//
//  MenuInfo.m
//  YPER
//
//  Created by coanyaa on 2015. 12. 22..
//  Copyright © 2015년 joy2x. All rights reserved.
//

#import "MenuInfo.h"

@implementation MenuInfo

- (id)initWithTitle:(NSString*)title type:(NSInteger)type imageName:(NSString*)imageName object:(id)object
{
    self = [super init];
    if( self ){
        self.title = title;
        self.type = type;
        self.imageName = imageName;
        self.object = object;
    }
    
    return self;
}
@end
