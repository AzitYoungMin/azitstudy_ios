//
//  MenuInfo.h
//  YPER
//
//  Created by coanyaa on 2015. 12. 22..
//  Copyright © 2015년 joy2x. All rights reserved.
//

#import "ModelBase.h"

@interface MenuInfo : ModelBase
@property (assign, nonatomic) NSInteger type;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *imageName;
@property (strong, nonatomic) id object;

- (id)initWithTitle:(NSString*)title type:(NSInteger)type imageName:(NSString*)imageName object:(id)object;
@end
