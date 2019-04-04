//
//  FQBaseTool.h
//  FQBaseKit
//
//  Created by mac on 2019/1/16.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>
#import "FQTextView.h"

NS_ASSUME_NONNULL_BEGIN

@interface FQBaseTool : NSObject

/**单例创建Tools*/
+ (instancetype )sharedTools;

/**
 *  删除Web的缓存(兼容iOS8)
 */
+ (void)fq_removeWebCache;

/**获取明天时间*/
+ (NSString *)fq_getTomorrowDayWithDateFormat:(NSString *)format;
/**字符串转date时间*/
- (NSDate *)fq_stringToDate:(NSString *)dateString withDateFormat:(NSString *)format;
/**判断两个时间大小*/
+ (int)fq_compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay;
/**通过字符串计算Label大小*/
+ (CGRect)fq_getLabelRectWithString:(NSString *)string andSize:(CGSize)size andFont:(UIFont *)font;
/**判断时间在某个时间段内*/
+ (BOOL)fq_compareDate:(NSDate*)date isBeginDate:(NSDate*)beginDate andEndDate:(NSDate*)endDate;
/**将世界时间转化为中国区时间*/
- (NSDate *)fq_worldTimeToChinaTime:(NSDate *)date;
/**获取某个时间某天后的时间*/
+ (NSString *)fq_getSomeDayWithDate:(NSDate *)date Num:(int)num DateFormat:(NSString *)format;
/**将NSDate按格式时间输出*/
+ (NSString*)fq_dateToString:(NSDate *)date withFormat:(NSString *)format;
/**获取两个时间间隔天数*/
+(NSInteger)fq_getDaysFrom:(NSDate *)serverDate To:(NSDate *)endDate;
/**获取当地时区的时间*/
+ (NSDate *)fq_getLocalDate:(NSDate *)date;
/**
 查找路径及其子路径下所有指定类型文件
 
 @param type 文件类型
 @param path 路径
 @return 所有查找出来的文件路径
 */
+ (NSMutableArray *)fq_findAllFileWithType:(NSString *)type andPath:(NSString *)path;


/**
 查找路径及其子路径下所有指定类型文件所在文件夹路径
 
 @param type 文件类型
 @param path 文件所在文件夹路径
 @return 文件夹路径数组
 */
+ (NSMutableArray *)fq_findAllFolderWithType:(NSString *)type andPath:(NSString *)path;

/**
 判断是不是第一次启动
 */
+(BOOL)fq_isFirstLaunch;


/**
 判断是不是第一次进入某个页面
 */
+(BOOL)fq_isFirstWithClassName:(NSString *)className;


/**
 *  获取当前屏幕显示的viewcontroller
 */
+ (UIViewController *)fq_getCurrentViewController;


/**
 *  获取当前屏幕中present出来的viewcontroller
 */
+ (UIViewController *)fq_getPresentedViewController;


@end

NS_ASSUME_NONNULL_END
