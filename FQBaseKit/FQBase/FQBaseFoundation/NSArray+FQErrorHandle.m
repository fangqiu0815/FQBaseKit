//
//  NSArray+FQErrorHandle.m
//  FQBaseKit
//
//  Created by mac on 2019/1/16.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "NSArray+FQErrorHandle.h"

@implementation NSArray (FQErrorHandle)

/**
 *  防止数组越界
 */
- (id)fq_objectAtIndexVerify:(NSUInteger)index{
    if (index < self.count) {
        return [self objectAtIndex:index];
    }else{
        return nil;
    }
}
/**
 *  防止数组越界
 */
- (id)fq_objectAtIndexedSubscriptVerify:(NSUInteger)idx{
    if (idx < self.count) {
        return [self objectAtIndexedSubscript:idx];
    }else{
        return nil;
    }
}

@end

@implementation NSMutableArray (FQErrorHandle)

/**
 *  数组中插入数据
 */
- (void)fq_insertObjectVerify:(id)object atIndex:(NSInteger)index{
    if (index < self.count && object) {
        [self insertObject:object atIndex:index];
    }
}
/**
 *  数组中添加数据
 */
- (void)fq_addObjectVerify:(id)object{
    if (object) {
        [self addObject:object];
    }
}

- (id)fq_objectAtIndexCheck:(NSUInteger)index
{
    if (index >= [self count]) {
        return nil;
    }
    
    id value = [self objectAtIndex:index];
    if (value == [NSNull null]) {
        return nil;
    }
    return value;
}


@end
