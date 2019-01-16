//
//  NSBundle+FQAppIcon.m
//  FQBaseKit
//
//  Created by mac on 2019/1/16.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "NSBundle+FQAppIcon.h"

@implementation NSBundle (FQAppIcon)

- (NSString *)fq_appIconPath {
    NSString *iconFilename = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIconFile"] ;
    NSString *iconBasename = [iconFilename stringByDeletingPathExtension] ;
    NSString *iconExtension = [iconFilename pathExtension] ;
    return [[NSBundle mainBundle] pathForResource:iconBasename
                                           ofType:iconExtension] ;
}

- (UIImage *)fq_appIcon {
    UIImage *appIcon = [[UIImage alloc] initWithContentsOfFile:[self fq_appIconPath]] ;
    return appIcon;
}


@end
