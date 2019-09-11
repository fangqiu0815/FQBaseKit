//
//  NSHTTPCookieStorage+FQHTTPCookiesExtension.m
//  FQBaseKitDemo
//
//  Created by mac on 2019/1/25.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "NSHTTPCookieStorage+FQHTTPCookiesExtension.h"

@implementation NSHTTPCookieStorage (FQHTTPCookiesExtension)

/**
 *  @brief  /Persists UIWebView cookies to disk
 */
- (void)fq_saveCookie {
    NSMutableArray* cookieData = [NSMutableArray new];
    
    NSHTTPCookieStorage *cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (NSHTTPCookie* cookie in [cookieStorage cookies]) {
        NSMutableDictionary* cookieDictionary = [NSMutableDictionary new];
        cookieDictionary[NSHTTPCookieName] = cookie.name;
        cookieDictionary[NSHTTPCookieValue] = cookie.value;
        cookieDictionary[NSHTTPCookieDomain] = cookie.domain;
        cookieDictionary[NSHTTPCookiePath] = cookie.path;
        cookieDictionary[NSHTTPCookieSecure] = (cookie.isSecure ? @"YES" : @"NO");
        cookieDictionary[NSHTTPCookieVersion] = [NSString stringWithFormat:@"%zd", cookie.version];
        if (cookie.expiresDate) cookieDictionary[NSHTTPCookieExpires] = cookie.expiresDate;
        
        [cookieData addObject:cookieDictionary];
    }
    
    [cookieData writeToFile:[self storagePath] atomically:TRUE];
}
/**
 *  @brief  /load UIWebView cookies from disk
 */
- (void)fq_loadCookie {
    NSMutableArray* cookies = [NSMutableArray arrayWithContentsOfFile:[self storagePath]];
    NSHTTPCookieStorage *cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    
    for (NSDictionary* cookieData in cookies) {
        [cookieStorage setCookie:[NSHTTPCookie cookieWithProperties:cookieData]];
    }
}

- (NSString*)storagePath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    return [NSString stringWithFormat:@"%@/Cookies.data", paths[0]];
}


@end
