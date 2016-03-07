//
//  UIImageView+ImageCache.m
//  NameUp
//
//  Created by coanyaa on 2015. 4. 26..
//  Copyright (c) 2015년 Joy2x. All rights reserved.
//

#import <UIImageView+AFNetworking.h>
#import <AFNetworking.h>
#import "UIImageView+ImageCache.h"

#define DISKCACHESIZE                   (50 * 1024 * 1024)

@implementation UIImageView (ImageCache)

+ (void)cacheInitialize
{
    static NSURLCache *urlCache;
    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken,^{
        urlCache = [[NSURLCache alloc] initWithMemoryCapacity:0 diskCapacity:DISKCACHESIZE diskPath:nil];
    });
    [NSURLCache setSharedURLCache:urlCache];
}


+ (UIImage*)placeHolderImage
{
    static UIImage *noImg = nil;
    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken, ^{
//        noImg = [UIImage imageNamed:@"img_bg_logo"];
        noImg = [UIImage imageNamed:@"img_placeholder2"];
    });
    
    return noImg;
}

+ (UIImage*)cachedImageFromURL:(NSString*)url
{
    if( [url length] < 1 )
        return nil;
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:30.0f];
    return [[UIImageView sharedImageCache] cachedImageForRequest:urlRequest];
}

- (void)setCachedImageFromURL:(NSURL*)imageURL placeholderImage:(UIImage*)placeHolderImage
{
    [self setCachedImageFromURL:imageURL placeholderImage:placeHolderImage placeHolderContentMode:self.contentMode completeContentMode:self.contentMode success:nil failure:nil];
}

- (void)setCachedImageFromURL:(NSURL*)imageURL placeholderImage:(UIImage*)placeHolderImage success:(void(^)(UIImage *image))success failure:(void(^)(NSError *error))failure
{
    [self setCachedImageFromURL:imageURL placeholderImage:placeHolderImage placeHolderContentMode:self.contentMode completeContentMode:self.contentMode success:success failure:failure];
}

- (void)setCachedImageFromURL:(NSURL*)imageURL placeholderImage:(UIImage*)placeHolderImage placeHolderContentMode:(UIViewContentMode)placeHolderContentMode completeContentMode:(UIViewContentMode)completeContentMode success:(void(^)(UIImage *image))success failure:(void(^)(NSError *error))failure
{
    if( [[imageURL absoluteString] length] > 0 ){
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:imageURL cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:30.0f];
        UIImage *image = [[UIImageView sharedImageCache] cachedImageForRequest:urlRequest];
        
        if( image ){
            self.contentMode = completeContentMode;
            self.image = image;
            if( success )
                success(image);
        }
        else{
            __weak UIImageView *blockImageView = self;
            [((AFImageResponseSerializer *)self.imageResponseSerializer)  setAcceptableContentTypes:[NSSet setWithObjects:@"image/jpg",@"image/png",@"image/jpeg",@"image/gif",@"image/bmp",@"image/tiff",@"image/x-icon",@"image/xbm", nil]];
            [self setImageWithURLRequest:urlRequest placeholderImage:placeHolderImage success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                blockImageView.image = image;
                blockImageView.contentMode = completeContentMode;
                [[UIImageView sharedImageCache] cacheImage:image forRequest:urlRequest];
                if( success )
                    success(image);
            } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
                NSLog(@"%@ : %@",[request.URL absoluteString], error.userInfo);
                blockImageView.image = placeHolderImage;
                blockImageView.contentMode = placeHolderContentMode;
                if( failure )
                    failure(error);
            }];
        }
    }
    else{
        self.image = placeHolderImage;
        self.contentMode = placeHolderContentMode;
        if(failure)
            failure(nil);
    }
}


@end
