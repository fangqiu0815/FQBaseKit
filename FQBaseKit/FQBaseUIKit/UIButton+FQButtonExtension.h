//
//  UIButton+FQButtonExtension.h
//  FQBaseKitDemo
//
//  Created by mac on 2019/1/25.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, FQImagePosition) {
    FQImagePositionLeft = 0,              //图片在左，文字在右，默认
    FQImagePositionRight = 1,             //图片在右，文字在左
    FQImagePositionTop = 2,               //图片在上，文字在下
    FQImagePositionBottom = 3,            //图片在下，文字在上
};
NS_ASSUME_NONNULL_BEGIN

@interface UIButton (FQButtonExtension)

/**
 *  利用UIButton的titleEdgeInsets和imageEdgeInsets来实现文字和图片的自由排列
 *  注意：这个方法需要在设置图片和文字之后才可以调用，且button的大小要大于 图片大小+文字大小+spacing
 *
 *  @param spacing 图片和文字的间隔
 */
- (void)fq_setImagePosition:(FQImagePosition)postion spacing:(CGFloat)spacing;

/**
 *  倒计时
 */
-(void)fq_startTime:(NSInteger )timeout title:(NSString *)tittle waitTittle:(NSString *)waitTittle;


@end

NS_ASSUME_NONNULL_END
