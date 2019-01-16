//
//  UIBarButtonItem+FQBarButtonItemCategory.m
//  FQBaseKit
//
//  Created by mac on 2019/1/16.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "UIBarButtonItem+FQBarButtonItemCategory.h"

@implementation UIBarButtonItem (FQBarButtonItemCategory)

// 把重复的代码抽取成方法
+ (UIBarButtonItem *)createItemWithImage:(UIImage *)image highImage:(UIImage *)highImage addTarget:(id)target action:(SEL)action
{
    // 设置导航条右侧的按钮
    UIButton *btn = [[UIButton alloc] init];
    // 设置普通图片
    [btn setImage:image forState:UIControlStateNormal];
    // 设置高亮图片
    [btn setImage:highImage forState:UIControlStateHighlighted];
    // 添加点击事件
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchDown];
    // 让系统计算一下按钮的尺寸
    [btn sizeToFit];
    // 问题:UIBarButton点击范围过大
    // 解决：在按钮的外面包装一层UIView
    UIView *btnView = [[UIView alloc] init];
    btnView.frame = btn.bounds;
    [btnView addSubview:btn];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btnView];
    return item;
}

+ (UIBarButtonItem *)createItemWithImage:(UIImage *)image selImage:(UIImage *)selImage addTarget:(id)target action:(SEL)action;
{
    // 设置导航条右侧的按钮
    UIButton *btn = [[UIButton alloc] init];
    // 设置普通图片
    [btn setImage:image forState:UIControlStateNormal];
    // 设置选中图片
    [btn setImage:selImage forState:UIControlStateSelected];
    // 添加点击事件
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchDown];
    // 让系统计算一下按钮的尺寸
    [btn sizeToFit];
    // 问题:UIBarButton点击范围过大
    // 解决：在按钮的外面包装一层UIView
    UIView *btnView = [[UIView alloc] init];
    btnView.frame = btn.bounds;
    [btnView addSubview:btn];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btnView];
    return item;
}


/**
 
 */
+ (UIBarButtonItem *)backItemWithImage:(UIImage *)image highImage:(UIImage *)highImage title:(NSString *)title addTarget:(id)target action:(SEL)action
{
    // 设置导航条右侧的按钮
    UIButton *btn = [[UIButton alloc] init];
    // 设置按钮标题
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    // 设置默认状态字体颜色
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    // 设置高亮状态字体颜色
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    // 设置普通图片
    [btn setImage:image forState:UIControlStateNormal];
    // 设置高亮图片
    [btn setImage:highImage forState:UIControlStateHighlighted];
    // 添加点击事件
    [btn addTarget:target action:action
  forControlEvents:UIControlEventTouchDown];
    // 让系统计算一下按钮的尺寸
    [btn sizeToFit];
    // 问题:UIBarButton点击范围过大
    // 解决：在按钮的外面包装一层UIView
    UIView *btnView = [[UIView alloc] init];
    btnView.frame = btn.bounds;
    [btnView addSubview:btn];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btnView];
    return item;
}

// 设置图片按钮,normal:常规图片，highlighted:高亮图片
- (id)initWithNormalIcon:(NSString *)normal highlightedIcon:(NSString *)highlighted target:(id)target action:(SEL)action {
    UIImage *image = [UIImage imageNamed:normal];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    if (highlighted) {
        [btn setBackgroundImage:[UIImage imageNamed:highlighted] forState:UIControlStateHighlighted];
    }
    btn.bounds = (CGRect){CGPointZero, image.size};
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [self initWithCustomView:btn];
}

+ (id)itemWithNormalIcon:(NSString *)normal highlightedIcon:(NSString *)highlighted target:(id)target action:(SEL)action {
    return [[self alloc] initWithNormalIcon:normal highlightedIcon:highlighted target:target action:action];
}

// 设置文字按钮，默认文字颜色：高亮颜色：
- (id)initWithTitle:(NSString *)title target:(id)target action:(SEL)action {
    return [self initWithTitle:title normalColor:NormalColor highlightedColor:HighlightedColor target:target action:action];
}

+ (id)itemWithTitle:(NSString *)title target:(id)target action:(SEL)action {
    return [[self alloc] initWithTitle:title target:target action:action];
}

// 设置文字按钮, backgroundImage:背景图片，normal：常规颜色 Highlighted：高亮颜色
- (id)initWithTitle:(NSString *)title backgroundImage:(UIImage *)backImage target:(id)target action:(SEL)action {
    return [self initWithTitle:title backgroundImage:backImage normalColor:NormalColor highlightedColor:HighlightedColor target:target action:action];
}

+ (id)itemWithTitle:(NSString *)title backgroundImage:(UIImage *)backImage target:(id)target action:(SEL)action {
    return [[self alloc] initWithTitle:title backgroundImage:backImage target:target action:action];
}

// 设置文字按钮，normal：常规颜色 Highlighted：高亮颜色
+ (id)itemWithTitle:(NSString *)title normalColor:(UIColor *)normal highlightedColor:(UIColor *)highlighted target:(id)target action:(SEL)action {
    return [[self alloc] initWithTitle:title backgroundImage:[UIImage new] normalColor:normal highlightedColor:highlighted target:target action:action];
}

- (id)initWithTitle:(NSString *)title normalColor:(UIColor *)normal highlightedColor:(UIColor *)highlighted target:(id)target action:(SEL)action {
    return [self initWithTitle:title backgroundImage:[UIImage new] normalColor:normal highlightedColor:highlighted target:target action:action];
}

// 设置文字按钮，backgroundImage:背景图片 normal：常规颜色 Highlighted：高亮颜色
+ (id)itemWithTitle:(NSString *)title backgroundImage:(UIImage *)backImage normalColor:(UIColor *)normal highlightedColor:(UIColor *)highlighted target:(id)target action:(SEL)action {
    return [[self alloc] initWithTitle:title backgroundImage:backImage normalColor:normal highlightedColor:highlighted target:target action:action];
}

- (id)initWithTitle:(NSString *)title backgroundImage:(UIImage *)backImage normalColor:(UIColor *)normal highlightedColor:(UIColor *)highlighted target:(id)target action:(SEL)action {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor clearColor];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:normal forState:UIControlStateNormal];
    [btn setTitleColor:highlighted forState:UIControlStateHighlighted];
    [btn setBackgroundImage:backImage forState:UIControlStateNormal];
    [btn setBackgroundImage:backImage forState:UIControlStateHighlighted];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    btn.titleLabel.font = [UIFont systemFontOfSize:16];
    
    if (CGSizeEqualToSize(backImage.size, CGSizeZero)) {
        CGSize size = [btn.titleLabel sizeThatFits:CGSizeMake(100, 44)];
        btn.frame = CGRectMake(0, 0, size.width, size.height);
    }else {
        btn.frame = CGRectMake(0, 0, backImage.size.width, backImage.size.height);
    }
    
    return [self initWithCustomView:btn];
}


@end
