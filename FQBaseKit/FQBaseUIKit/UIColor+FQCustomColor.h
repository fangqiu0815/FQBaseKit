//
//  UIColor+FQCustomColor.h
//  FQBaseKitDemo
//
//  Created by mac on 2019/1/22.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (FQCustomColor)

// 透明度固定为1，以0x开头的十六进制转换成的颜色
+ (UIColor *)colorWithHex:(long)hexColor;
// 0x开头的十六进制转换成的颜色,透明度可调整
+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)opacity;
// 颜色转换三：iOS中十六进制的颜色（以#开头）转换为UIColor
+ (UIColor *)colorWithHexString: (NSString *)color;

//color颜色分类方法  颜色 eg. #FFFFFF
+ (instancetype)fq_colorWithHexString:(NSString *)hexString;
//fq_color颜色分类方法
+ (instancetype)fq_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

/**
 *  @brief  随机颜色
 *
 *  @return UIColor
 */
+ (UIColor *)fq_randomColor;

/**
 *  @brief  获取canvas用的颜色字符串
 *
 *  @return canvas颜色
 */
- (NSString *)fq_canvasColorString;
/**
 *  @brief  获取网页颜色字串
 *
 *  @return 网页颜色
 */
- (NSString *)fq_webColorString;

@end

NS_ASSUME_NONNULL_END
