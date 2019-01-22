//
//  UIView+FQToast.h
//  FQBaseKit
//
//  Created by mac on 2019/1/16.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
extern NSString * const FQToastPositionTop;
extern NSString * const FQToastPositionCenter;
extern NSString * const FQToastPositionBottom;
NS_ASSUME_NONNULL_BEGIN

@interface UIView (FQToast)

// each makeToast method creates a view and displays it as toast
- (void)fq_makeToast:(NSString *)message;
- (void)fq_makeToast:(NSString *)message duration:(NSTimeInterval)interval position:(id)position;
- (void)fq_makeToast:(NSString *)message duration:(NSTimeInterval)interval position:(id)position image:(UIImage *)image;
- (void)fq_makeToast:(NSString *)message duration:(NSTimeInterval)interval position:(id)position title:(NSString *)title;
- (void)fq_makeToast:(NSString *)message duration:(NSTimeInterval)interval position:(id)position title:(NSString *)title image:(UIImage *)image;

// displays toast with an activity spinner
- (void)fq_makeToastActivity;
- (void)fq_makeToastActivity:(id)position;
- (void)fq_hideToastActivity;

// the showToast methods display any view as toast
- (void)fq_showToast:(UIView *)toast;
- (void)fq_showToast:(UIView *)toast duration:(NSTimeInterval)interval position:(id)point;
- (void)fq_showToast:(UIView *)toast duration:(NSTimeInterval)interval position:(id)point
         tapCallback:(void(^)(void))tapCallback;

@end

NS_ASSUME_NONNULL_END
