//
//  UIView+FQFrameCategory.h
//  FQBaseKit
//
//  Created by mac on 2019/1/16.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
// 分类的特点：1.声明的属性不会生成成员变量，但是可以有setter和getter方法

@interface UIView (FQFrameCategory)
// 宽度
@property CGFloat fq_width;
// 高度
@property CGFloat fq_height;
@property CGFloat fq_x;
@property CGFloat fq_y;
@property CGFloat fq_centerX;
@property CGFloat fq_centerY;
@property CGSize fq_size;
@property CGFloat fq_bottom;
@property (nonatomic, assign, readonly) CGFloat fq_right;

@property (nonatomic) CGPoint fq_origin;      ///< Shortcut for frame.origin.

/**
 *  CGAffineTransformMakeScale
 */
@property (nonatomic) CGFloat  fq_scale;

/**
 *  CGAffineTransformMakeRotation
 */
@property (nonatomic) CGFloat  fq_angle;

/**
 * 判断一个控件是否真正显示在主窗口
 */
- (BOOL)fq_isShowingOnKeyWindow;


@end

@interface CALayer (FQFrameCategory)

@property (nonatomic, assign) CGFloat hs_x;
@property (nonatomic, assign) CGFloat hs_y;
@property (nonatomic, assign) CGFloat hs_width;
@property (nonatomic, assign) CGFloat hs_height;
@property (nonatomic, assign) CGSize  hs_size;

@end


NS_ASSUME_NONNULL_END
