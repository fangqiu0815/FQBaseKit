//
//  NSHTTPCookieStorage+FQHTTPCookiesExtension.h
//  FQBaseKitDemo
//
//  Created by mac on 2019/1/25.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSHTTPCookieStorage (FQHTTPCookiesExtension)

/**
 *  @brief 存储 UIWebView cookies到磁盘目录
 */
- (void)fq_saveCookie;
/**
 *  @brief 读取UIWebView cookies从磁盘目录
 */
- (void)fq_loadCookie;

@end

NS_ASSUME_NONNULL_END
