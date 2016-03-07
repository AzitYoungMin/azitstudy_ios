//
//  UIButton+ImageCache.h
//  dingdong
//
//  Created by coanyaa on 2015. 6. 16..
//  Copyright (c) 2015년 Timesystem. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ImageCache)

- (void)setImageForState:(UIControlState)state imageURL:(NSURL *)imageURL placeholderImage:(UIImage *)placeholderImage;
- (void)setImageForState:(UIControlState)state imageURL:(NSURL*)imageURL placeholderImage:(UIImage*)placeHolderImage success:(void(^)(UIImage *image))success failure:(void(^)(NSError *error))failure;
@end
