//
//  UIView+FQFrameCategory.m
//  FQBaseKit
//
//  Created by mac on 2019/1/16.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "UIView+FQFrameCategory.h"
#import <objc/runtime.h>

@implementation UIView (FQFrameCategory)

- (CGFloat)fq_height
{
    return self.frame.size.height;
}

- (void)setFq_height:(CGFloat)fq_height
{
    CGRect frame = self.frame;
    frame.size.height = fq_height;
    self.frame = frame;
}

- (CGFloat)fq_width
{
    return self.frame.size.width;
}

- (void)setFq_width:(CGFloat)fq_width
{
    CGRect frame = self.frame;
    frame.size.width = fq_width;
    self.frame = frame;
}


- (CGFloat)fq_centerX
{
    return self.center.x;
}

- (void)setFq_centerX:(CGFloat)fq_centerX
{
    CGPoint center = self.center;
    center.x = fq_centerX;
    self.center = center;
}

- (CGFloat)fq_centerY
{
    return self.center.y;
}

- (void)setFq_centerY:(CGFloat)fq_centerY
{
    CGPoint center = self.center;
    center.y = fq_centerY;
    self.center = center;
}

- (CGFloat)fq_x
{
    return self.frame.origin.x;
}

- (void)setFq_x:(CGFloat)fq_x
{
    CGRect frame = self.frame;
    frame.origin.x = fq_x;
    self.frame = frame;
}
- (CGFloat)fq_y
{
    return self.frame.origin.y;
}

- (void)setFq_y:(CGFloat)fq_y
{
    CGRect frame = self.frame;
    frame.origin.y = fq_y;
    self.frame = frame;
}

- (void)setFq_size:(CGSize)fq_size{
    CGRect frame = self.frame;
    frame.size = fq_size;
    self.frame = frame;
}

- (CGSize)fq_size{
    return self.frame.size;
}

- (CGFloat)fq_bottom{
    
    return CGRectGetMaxY(self.frame);
}

- (void)setFq_bottom:(CGFloat)fq_bottom{
    
    self.fq_y = fq_bottom - self.fq_height;
}


- (CGPoint)fq_origin {
    return self.frame.origin;
}

- (void)setFq_origin:(CGPoint)fq_origin {
    CGRect frame = self.frame;
    frame.origin = fq_origin;
    self.frame = frame;
}

- (CGFloat)fq_right {
    return CGRectGetMaxX(self.frame);
}

NSString * const _recognizerScale = @"_recognizerScale";

- (void)setFq_scale:(CGFloat)fq_scale {
    
    objc_setAssociatedObject(self, (__bridge const void *)(_recognizerScale), @(fq_scale), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.transform = CGAffineTransformMakeScale(fq_scale, fq_scale);
}

- (CGFloat)fq_scale {
    
    NSNumber *scaleValue = objc_getAssociatedObject(self, (__bridge const void *)(_recognizerScale));
    return scaleValue.floatValue;
}

#pragma mark - Angle.

NSString * const _recognizerAngle = @"_recognizerAngle";

- (void)setFq_angle:(CGFloat)fq_angle {
    
    objc_setAssociatedObject(self, (__bridge const void *)(_recognizerAngle), @(fq_angle), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.transform = CGAffineTransformMakeRotation(fq_angle);
}

- (CGFloat)fq_angle {
    
    NSNumber *angleValue = objc_getAssociatedObject(self, (__bridge const void *)(_recognizerAngle));
    return angleValue.floatValue;
}

- (BOOL)fq_isShowingOnKeyWindow
{
    // 主窗口
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    
    // 以主窗口左上角为坐标原点, 计算self的矩形框
    CGRect newFrame = [keyWindow convertRect:self.frame fromView:self.superview];
    CGRect winBounds = keyWindow.bounds;
    
    // 主窗口的bounds 和 self的矩形框 是否有重叠
    BOOL intersects = CGRectIntersectsRect(newFrame, winBounds);
    
    return !self.isHidden && self.alpha > 0.01 && self.window == keyWindow && intersects;
}



@end

@implementation CALayer(FQFrameCategory)

- (void)setHs_x:(CGFloat)hs_x
{
    CGRect frame = self.frame;
    frame.origin.x = hs_x;
    self.frame = frame;
}

- (CGFloat)hs_x
{
    return self.frame.origin.x;
}

- (void)setHs_y:(CGFloat)hs_y
{
    CGRect frame = self.frame;
    frame.origin.y = hs_y;
    self.frame = frame;
}

- (CGFloat)hs_y
{
    return self.frame.origin.y;
}

- (void)setHs_size:(CGSize)hs_size
{
    CGRect frame = self.frame;
    frame.size = hs_size;
    self.frame = frame;
    
}

- (CGSize)hs_size
{
    return self.frame.size;
}

- (void)setHs_height:(CGFloat)hs_height
{
    CGRect frame = self.frame;
    frame.size.height = hs_height;
    self.frame = frame;
}

- (CGFloat)hs_height
{
    return self.frame.size.height;
}

- (void)setHs_width:(CGFloat)hs_width
{
    CGRect frame = self.frame;
    frame.size.width = hs_width;
    self.frame = frame;
    
}

-(CGFloat)hs_width
{
    return self.frame.size.width;
}



@end

