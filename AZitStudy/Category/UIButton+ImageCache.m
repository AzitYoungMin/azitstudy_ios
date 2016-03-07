//
//  UIButton+ImageCache.m
//  dingdong
//
//  Created by coanyaa on 2015. 6. 16..
//  Copyright (c) 2015년 Timesystem. All rights reserved.
//
#import <AFNetworking.h>
#import <UIButton+AFNetworking.h>
#import <UIImageView+AFNetworking.h>
#import "UIButton+ImageCache.h"

@implementation UIButton (ImageCache)

- (void)setImageForState:(UIControlState)state imageURL:(NSURL *)imageURL placeholderImage:(UIImage *)placeholderImage
{
    [self setImageForState:state imageURL:imageURL placeholderImage:placeholderImage success:nil failure:nil];
}

- (void)setImageForState:(UIControlState)state imageURL:(NSURL*)imageURL placeholderImage:(UIImage*)placeHolderImage success:(void(^)(UIImage *image))success failure:(void(^)(NSError *error))failure
{
    if( [[imageURL absoluteString] length] > 0 ){
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:imageURL cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:30.0f];
        UIImage *image = [[UIButton sharedImageCache] cachedImageForRequest:urlRequest];
        
        if( image ){
            [self setImage:image forState:state];
            if( success )
                success(image);
        }
        else{
            __weak UIButton *blockButton = self;
            [((AFImageResponseSerializer *)self.imageResponseSerializer)  setAcceptableContentTypes:[NSSet setWithObjects:@"image/jpg",@"image/png",@"image/jpeg",@"image/gif",@"image/bmp",@"image/tiff",@"image/x-icon",@"image/xbm", nil]];
            [self setImageForState:state withURLRequest:urlRequest placeholderImage:placeHolderImage success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                [blockButton setImage:image forState:state];
                [[UIButton sharedImageCache] cacheImage:image forRequest:urlRequest];
                if( success )
                    success(image);
            } failure:^(NSError *error) {
                NSLog(@"%@ : %@",[urlRequest.URL absoluteString], error.userInfo);
                [blockButton setImage:placeHolderImage forState:state];
                if( failure )
                    failure(error);
            }];
        }
    }
    else{
        [self setImage:placeHolderImage forState:state];
    }
}

@end
