//
//  FQTextView.h
//  TouchInstantCash
//
//  Created by mac on 2018/8/28.
//  Copyright © 2018年 zongsheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FQTextView;

typedef NS_ENUM(NSUInteger, FQTextViewWordTipsType) {
    FQTextViewWordTipsTypeNone,         // 右侧无提示
    FQTextViewWordTipsTypeRight,        // 文字提示在右侧
    FQTextViewWordTipsTypeBottomRight,  // 文字提示在右侧底部
};

@interface FQTextView : UITextView
<UITextViewDelegate>

@property (copy, nonatomic) NSString *fq_placeholder;
@property (assign, nonatomic) NSInteger fq_maxLength;//最大长度
@property (strong, nonatomic) UILabel *fq_placeholderLabel;
@property (strong, nonatomic) UILabel *fq_wordNumLabel;
/** 类型 */
@property (nonatomic, assign) FQTextViewWordTipsType fq_tipsType;


//文字输入
@property (copy, nonatomic) void(^fq_didChangeText)(FQTextView *textView);
- (void)fq_didChangeText:(void(^)(FQTextView *textView))block;

@end
