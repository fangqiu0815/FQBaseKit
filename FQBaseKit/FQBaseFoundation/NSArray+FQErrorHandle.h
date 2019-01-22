//
//  NSArray+FQErrorHandle.h
//  FQBaseKit
//
//  Created by mac on 2019/1/16.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (FQErrorHandle)

/**
 为数组分类添加的方法  可以在应用中直接调用 可以防止数组越界导致的crash
 
 @param index 传入的取值下标
 @return id类型的数据
 */
- (id)fq_objectAtIndexVerify:(NSUInteger)index;
- (id)fq_objectAtIndexedSubscriptVerify:(NSUInteger)idx;

@end

@interface NSMutableArray (FQErrorHandle)

/**
 数组中插入数据
 
 @param object 数据
 @param index 下标
 */
- (void)fq_insertObjectVerify:(id)object atIndex:(NSInteger)index;
/**
 数组中添加数据
 
 @param object 数据
 */
- (void)fq_addObjectVerify:(id)object;
/**
 检查可变数组是否越界
 
 @param index 角标
 
 @return 检查是否越界和NSNull如果是返回nil
 */
- (id)fq_objectAtIndexCheck:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END
