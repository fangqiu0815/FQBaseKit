//
//  UITabBarItem+FQImageWebCache.m
//  FQBaseKitDemo
//
//  Created by mac on 2019/1/26.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "UITabBarItem+FQImageWebCache.h"

@implementation UITabBarItem (FQImageWebCache)

- (void)fq_setImageWithURL:(NSString *)urlString withImage:(UIImage *)placeholderImage {
    
    [[FQImageCacheManager sharedImageCacheManager] getImageWithUrl:urlString complete:^(UIImage *image) {
        //使用图片
        if (image == NULL) {
            self.image = [placeholderImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        } else {
            self.image = [self scaleImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] toScale:0.5];
        }
    }];
}

- (void)fq_setImageWithURL:(NSString *)urlString placeholderImage:(UIImage *)placeholderImage {
    self.image = [placeholderImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self fq_setImageWithURL:urlString withImage:placeholderImage];
}

- (void)fq_setSelectImageWithURL:(NSString *)urlString withImage:(UIImage *)placeholderImage {
    [[FQImageCacheManager sharedImageCacheManager] getImageWithUrl:urlString complete:^(UIImage *image) {
        //使用图片
        if (image == NULL) {
            self.selectedImage = [placeholderImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        } else {
            self.selectedImage = [self scaleImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] toScale:0.5];
        }
    }];
}

- (void)fq_setSelectImageWithURL:(NSString *)urlString placeholderImage:(UIImage *)placeholderImage {
    self.selectedImage = [placeholderImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self fq_setSelectImageWithURL:urlString withImage:placeholderImage];
}

- (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(image.size.width * scaleSize, image.size.height * scaleSize), NO, 0);
    [image drawInRect:CGRectIntegral(CGRectMake(0, 0, image.size.width * scaleSize, image.size.height * scaleSize))];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return [scaledImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}


@end
