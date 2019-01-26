//
//  UIWebView+FQWebViewJavaScript.h
//  FQBaseKitDemo
//
//  Created by mac on 2019/1/25.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIWebView (FQWebViewJavaScript)

/**
 *  @brief  获取网页meta信息
 *
 *  @return meta信息
 */
-(NSArray *)fq_getMetaData;

#pragma mark -
#pragma mark 获取网页中的数据
/// 获取某个标签的结点个数
- (int)fq_nodeCountOfTag:(NSString *)tag;
/// 获取当前页面URL
- (NSString *)fq_getCurrentURL;
/// 获取标题
- (NSString *)fq_getTitle;
/// 获取图片
- (NSArray *)fq_getImgs;
/// 获取当前页面所有链接
- (NSArray *)fq_getOnClicks;
#pragma mark -
#pragma mark 改变网页样式和行为
/// 改变背景颜色
- (void)fq_setBackgroundColor:(UIColor *)color;
/// 为所有图片添加点击事件(网页中有些图片添加无效)
- (void)fq_addClickEventOnImg;
/// 改变所有图像的宽度
- (void)fq_setImgWidth:(int)size;
/// 改变所有图像的高度
- (void)fq_setImgHeight:(int)size;
/// 改变指定标签的字体颜色
- (void)fq_setFontColor:(UIColor *) color withTag:(NSString *)tagName;
/// 改变指定标签的字体大小
- (void)fq_setFontSize:(int) size withTag:(NSString *)tagName;

#pragma mark 删除
///根据 ElementsID 删除WebView 中的节点
- (void )fq_deleteNodeByElementID:(NSString *)elementID;
/// 根据 ElementsClass 删除 WebView 中的节点
- (void )fq_deleteNodeByElementClass:(NSString *)elementClass;
///根据  TagName 删除 WebView 的节点
- (void)fq_deleteNodeByTagName:(NSString *)elementTagName;


@end

NS_ASSUME_NONNULL_END
