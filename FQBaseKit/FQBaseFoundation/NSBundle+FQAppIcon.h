//
//  NSBundle+FQAppIcon.h
//  FQBaseKit
//
//  Created by mac on 2019/1/16.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (FQAppIcon)

- (NSString *)fq_appIconPath ;

- (UIImage *)fq_appIcon ;

@end

NS_ASSUME_NONNULL_END
