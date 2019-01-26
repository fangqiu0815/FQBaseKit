//
//  NSObject+FQAppInfo.h
//  FQBaseKitDemo
//
//  Created by mac on 2019/1/25.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (FQAppInfo)

/// 当前版本
-(NSString *)fq_version;
/// 当前构建版本
-(NSInteger)fq_build;
/// 当前包名
-(NSString *)fq_identifier;
/// 当前语言
-(NSString *)fq_currentLanguage;
/// 当前设备
-(NSString *)fq_deviceModel;

@end

NS_ASSUME_NONNULL_END
