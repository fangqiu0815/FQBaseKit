//
//  UITextView+FQTextView.m
//  FQBaseKitDemo
//
//  Created by mac on 2019/1/25.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "UITextView+FQTextView.h"
#import <objc/runtime.h>

@interface UITextView ()

@property (nonatomic,strong) UILabel *fq_placeholderLabel;//占位符
@property (nonatomic,strong) UILabel *fq_wordCountLabel;//计算字数

@end

@implementation UITextView (FQTextView)

static NSString *PLACEHOLDLABEL = @"placelabel";
static NSString *PLACEHOLD = @"placehold";
static NSString *PLACEHOLDCOLOR = @"placeholdcolor";
static NSString *WORDCOUNTLABEL = @"wordcount";
static const void *limitLengthKey = &limitLengthKey;
static const void *limitLinesKey = &limitLinesKey;


#pragma mark -- set/get...

- (void)setFq_placeHolderColor:(UIColor *)fq_placeHolderColor
{
    objc_setAssociatedObject(self, &PLACEHOLDCOLOR, fq_placeHolderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setPlaceHolderColor:fq_placeHolderColor];
}

- (void)setPlaceHolderColor:(UIColor *)placeHolderColor
{
    self.fq_placeholderLabel.textColor = placeHolderColor;
}

- (UIColor *)fq_placeHolderColor
{
    return objc_getAssociatedObject(self, &PLACEHOLDCOLOR);
}

- (void)setFq_placeholderLabel:(UILabel *)fq_placeholderLabel
{
    objc_setAssociatedObject(self, &PLACEHOLDLABEL, fq_placeholderLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UILabel *)fq_placeholderLabel {
    
    return objc_getAssociatedObject(self, &PLACEHOLDLABEL);
    
}

- (void)setFq_placeholder:(NSString *)fq_placeholder
{
    objc_setAssociatedObject(self, &PLACEHOLD, fq_placeholder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setPlaceHolderLabel:fq_placeholder];
}

- (NSString *)fq_placeholder {
    
    return objc_getAssociatedObject(self, &PLACEHOLD);
}


- (UILabel *)fq_wordCountLabel {
    
    return objc_getAssociatedObject(self, &WORDCOUNTLABEL);
    
}

- (void)setFq_wordCountLabel:(UILabel *)fq_wordCountLabel
{
    objc_setAssociatedObject(self, &WORDCOUNTLABEL, fq_wordCountLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (NSNumber *)fq_limitLength {
    
    return objc_getAssociatedObject(self, limitLengthKey);
}

- (void)setFq_limitLength:(NSNumber *)fq_limitLength
{
    objc_setAssociatedObject(self, limitLengthKey, fq_limitLength, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addLimitLengthObserver:[fq_limitLength intValue]];
    [self setWordcountLable:fq_limitLength];
}

- (NSNumber *)fq_limitLines {
    return objc_getAssociatedObject(self, limitLinesKey);
}

- (void)setFq_limitLines:(NSNumber *)fq_limitLines
{
    objc_setAssociatedObject(self, limitLinesKey, fq_limitLines, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addLimitLengthObserver:[fq_limitLines intValue]];
}


#pragma mark -- 配置占位符标签

- (void)setPlaceHolderLabel:(NSString *)placeholder {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewChanged:) name:UITextViewTextDidChangeNotification object:self];
    if (self.fq_placeholderLabel) {
        [self.fq_placeholderLabel removeFromSuperview];
    }
    /*
     *  占位字符
     */
    self.fq_placeholderLabel = [[UILabel alloc] init];
    self.fq_placeholderLabel.font = self.font?self.font:self.cacutDefaultFont;
    self.fq_placeholderLabel.text = placeholder;
    self.fq_placeholderLabel.textAlignment = self.textAlignment;
    self.fq_placeholderLabel.numberOfLines = 0;
    self.fq_placeholderLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.fq_placeholderLabel.textColor = [UIColor lightGrayColor];
    CGRect rect = [placeholder boundingRectWithSize:CGSizeMake(CGRectGetWidth(self.frame)+20, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: self.font?self.font:self.cacutDefaultFont} context:nil];
    self.fq_placeholderLabel.frame = CGRectMake(7, 8, rect.size.width, rect.size.height);
    [self addSubview:self.fq_placeholderLabel];
    self.fq_placeholderLabel.hidden = self.text.length > 0 ? YES : NO;
    self.fq_wordCountLabel.text = [NSString stringWithFormat:@"%lu/%@",(unsigned long)self.text.length,self.fq_limitLength];
    
}

- (UIFont *)cacutDefaultFont{
    static UIFont *font = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UITextView *textview = [[UITextView alloc] init];
        textview.text = @" ";
        font = textview.font;
    });
    return font;
}

//- (void)setAttributedPlaceholder:(NSAttributedString *)attributedPlaceholder {
//    self.placeholderLabel.attributedText = attributedPlaceholder;
//    [self updatePlaceholderLabel];
//}

#pragma mark -- 配置字数限制标签

- (void)setWordcountLable:(NSNumber *)limitLength {
    if (self.fq_wordCountLabel) {
        [self.fq_wordCountLabel removeFromSuperview];
    }
    /*
     *  字数限制
     */
    self.fq_wordCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.frame) - 65, CGRectGetHeight(self.frame) - 20, 60, 20)];
    self.fq_wordCountLabel.textAlignment = NSTextAlignmentRight;
    self.fq_wordCountLabel.textColor = [UIColor lightGrayColor];
    self.fq_wordCountLabel.font = [UIFont systemFontOfSize:13.];
    if (self.text.length > [limitLength integerValue]) {
        self.text = [self.text substringToIndex:[self.fq_limitLength intValue]];
    }
    self.fq_wordCountLabel.text = [NSString stringWithFormat:@"%lu/%@",(unsigned long)self.text.length,limitLength];
    [self addSubview:self.fq_wordCountLabel];
    
}

#pragma mark -- 增加限制位数的通知
- (void)addLimitLengthObserver:(int)length {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(limitLengthEvent) name:UITextViewTextDidChangeNotification object:self];
}

#pragma mark -- 限制输入的位数
- (void)limitLengthEvent {
    
    if (self.fq_limitLength) {//字数限制
        if ([self.text length] > [self.fq_limitLength intValue]) {
            self.text = [self.text substringToIndex:[self.fq_limitLength intValue]];
            NSLog(@"Maximum number of words");
        }
    }else {
        if (self.fq_limitLines) {//行数限制
            CGSize size = [self getStringPlaceSize:self.text textFont:self.font bundingSize:CGSizeMake(self.contentSize.width-10, CGFLOAT_MAX)];
            if (size.height > self.font.lineHeight * [self.fq_limitLines intValue]) {
                self.text = [self.text substringToIndex:self.text.length - 1];
                NSLog(@"Maximum number of lines");
            }
        }
    }
    
}

#pragma mark -- NSNotification

- (void)textViewChanged:(NSNotification *)notification {
    if (self.fq_placeholder) {
        self.fq_placeholderLabel.hidden = YES;
        
        if (self.text.length == 0) {
            
            self.fq_placeholderLabel.hidden = NO;
        }
    }
    if (self.fq_limitLength) {
        
        NSInteger wordCount = self.text.length;
        if (wordCount > [self.fq_limitLength integerValue]) {
            wordCount = [self.fq_limitLength integerValue];
        }
        self.fq_wordCountLabel.text = [NSString stringWithFormat:@"%ld/%@",(long)wordCount,self.fq_limitLength];
    }
    
}

- (CGSize)getStringPlaceSize:(NSString *)string textFont:(UIFont *)font bundingSize:(CGSize)boundSize {
    ///计算文本高度
    NSDictionary *attribute = @{NSFontAttributeName:font};
    NSStringDrawingOptions option = (NSStringDrawingOptions)(NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading);
    CGSize size = [string boundingRectWithSize:boundSize options:option attributes:attribute context:nil].size;
    return size;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UITextViewTextDidChangeNotification
                                                  object:self];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.fq_limitLength && self.fq_wordCountLabel) {
        /*
         *  避免外部使用了约束 这里再次更新frame
         */
        self.fq_wordCountLabel.frame = CGRectMake(CGRectGetWidth(self.frame) - 65, CGRectGetHeight(self.frame) - 20, 60, 20);
    }
    if (self.fq_placeholder && self.fq_placeholderLabel) {
        CGRect rect = [self.fq_placeholder boundingRectWithSize:CGSizeMake(CGRectGetWidth(self.frame)+20, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: self.font} context:nil];
        self.fq_placeholderLabel.frame = CGRectMake(7, 8, rect.size.width, rect.size.height);
    }
}


@end
