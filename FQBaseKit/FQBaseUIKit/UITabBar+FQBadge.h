//
//  UITabBar+FQBadge.h
//  FQBaseKitDemo
//
//  Created by mac on 2019/1/25.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITabBar (FQBadge)

- (void)showBadgeOnItemIndex:(int)index totalItems:(NSInteger)items;   //显示小红点

- (void)hideBadgeOnItemIndex:(int)index; //隐藏小红点

@end

NS_ASSUME_NONNULL_END
