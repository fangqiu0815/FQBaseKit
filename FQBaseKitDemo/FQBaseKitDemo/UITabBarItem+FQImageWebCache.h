//
//  UITabBarItem+FQImageWebCache.h
//  FQBaseKitDemo
//
//  Created by mac on 2019/1/26.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FQImageCacheManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITabBarItem (FQImageWebCache)

//从网址加载图片
- (void)fq_setImageWithURL:(NSString* )urlString withImage:(UIImage *)placeholderImage;

//从网址下载图片，没下载完毕前，显示占位图片
- (void)fq_setImageWithURL:(NSString* )urlString placeholderImage:(UIImage* )placeholderImage;
- (void)fq_setSelectImageWithURL:(NSString* )urlString withImage:(UIImage *)placeholderImage;

- (void)fq_setSelectImageWithURL:(NSString* )urlString placeholderImage:(UIImage* )placeholderImage;

@end

NS_ASSUME_NONNULL_END
