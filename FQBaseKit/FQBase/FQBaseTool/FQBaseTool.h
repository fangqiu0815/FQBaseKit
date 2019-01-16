//
//  FQBaseTool.h
//  FQBaseKit
//
//  Created by mac on 2019/1/16.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FQBaseTool : NSObject

/**
 *  删除Web的缓存(兼容iOS8)
 */
+ (void)fq_removeWebCache;

@end

NS_ASSUME_NONNULL_END
