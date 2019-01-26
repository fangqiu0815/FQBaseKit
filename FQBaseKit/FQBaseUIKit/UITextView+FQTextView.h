//
//  UITextView+FQTextView.h
//  FQBaseKitDemo
//
//  Created by mac on 2019/1/25.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextView (FQTextView)

/*
 * @param : placeholder 占位符         可与下面两个属性任意一个同时设置
 * @param : limitLength 需要限制的字数  优先级高于lines
 * @param : limitLines  需要限制的行数
 */
@property (nonatomic, strong) NSString *placeholder;
//@property (nonatomic, strong) NSAttributedString *attributedPlaceholder;

@property (nonatomic,  copy) NSNumber *limitLength;
@property (nonatomic,  copy) NSNumber *limitLines;

/* ******特殊说明。如果你想对textView.text直接赋值*******
 *       请务必在对placehoulder和limitLength之前进行
 一旦你对text赋值了，你需要立马重新对placeholder赋值。
 *       格式： textView.text = @"请务必写在placeholder和limitLength之前";
 *             textView.placeholder = @"喜欢请Star";
 *             textView.limitLength = @20;//如果赋值长度大于此长度会被自动截断！
 */


@end

NS_ASSUME_NONNULL_END
