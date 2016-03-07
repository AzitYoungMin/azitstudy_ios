//
//  UIImageView+ImageCache.h
//  NameUp
//
//  Created by coanyaa on 2015. 4. 26..
//  Copyright (c) 2015년 Joy2x. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (ImageCache)

+ (void)cacheInitialize;
+ (UIImage*)placeHolderImage;
+ (UIImage*)cachedImageFromURL:(NSString*)url;
- (void)setCachedImageFromURL:(NSURL*)imageURL placeholderImage:(UIImage*)placeHolderImage;
- (void)setCachedImageFromURL:(NSURL*)imageURL placeholderImage:(UIImage*)placeHolderImage success:(void(^)(UIImage *image))success failure:(void(^)(NSError *error))failure;
- (void)setCachedImageFromURL:(NSURL*)imageURL placeholderImage:(UIImage*)placeHolderImage placeHolderContentMode:(UIViewContentMode)placeHolderContentMode completeContentMode:(UIViewContentMode)completeContentMode success:(void(^)(UIImage *image))success failure:(void(^)(NSError *error))failure;

@end
