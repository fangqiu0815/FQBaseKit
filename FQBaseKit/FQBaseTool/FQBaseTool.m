//
//  FQBaseTool.m
//  FQBaseKit
//
//  Created by mac on 2019/1/16.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "FQBaseTool.h"
static FQBaseTool * manager = nil;
static NSString *const kAppVersion = @"ADappVersion";

@implementation FQBaseTool

+ (instancetype )sharedTools
{
    static dispatch_once_t onceToken;
    // dispatch_once  无论使用多线程还是单线程，都只执行一次
    dispatch_once(&onceToken, ^{
        manager = [[FQBaseTool alloc] init];
    });
    return manager;
}

/**
 *  删除Web的缓存(兼容iOS8)
 */
+ (void)fq_removeWebCache {
    if (@available(iOS 9.0, *)) {
        NSArray *array = @[
                           WKWebsiteDataTypeDiskCache,
                           //WKWebsiteDataTypeOfflineWebApplication
                           WKWebsiteDataTypeMemoryCache,
                           //WKWebsiteDataTypeLocal
                           WKWebsiteDataTypeCookies,
                           //WKWebsiteDataTypeSessionStorage,
                           //WKWebsiteDataTypeIndexedDBDatabases,
                           //WKWebsiteDataTypeWebSQLDatabases
                           ];
        NSSet *websiteDataTypes= [NSSet setWithArray:array];
        
        // All kinds of data
        //NSSet *websiteDataTypes = [WKWebsiteDataStore allWebsiteDataTypes];
        NSDate *dateFrom = [NSDate dateWithTimeIntervalSince1970:0];
        if ([NSThread isMainThread]) {
            [[WKWebsiteDataStore defaultDataStore] removeDataOfTypes:websiteDataTypes modifiedSince:dateFrom completionHandler:^{
                
            }];
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                [[WKWebsiteDataStore defaultDataStore] removeDataOfTypes:websiteDataTypes modifiedSince:dateFrom completionHandler:^{
                    
                }];
            });
        }
        
        [[NSURLCache sharedURLCache] removeAllCachedResponses];
        
    } else {
        //先删除cookie
        NSHTTPCookie *cookie;
        NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
        for (cookie in [storage cookies])
        {
            [storage deleteCookie:cookie];
        }
        
        NSString *libraryDir = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSString *bundleId  =  [[[NSBundle mainBundle] infoDictionary]
                                objectForKey:@"CFBundleIdentifier"];
        NSString *webkitFolderInLib = [NSString stringWithFormat:@"%@/WebKit",libraryDir];
        NSString *webKitFolderInCaches = [NSString
                                          stringWithFormat:@"%@/Caches/%@/WebKit",libraryDir,bundleId];
        NSString *webKitFolderInCachesfs = [NSString
                                            stringWithFormat:@"%@/Caches/%@/fsCachedData",libraryDir,bundleId];
        NSError *error;
        /* iOS8.0 WebView Cache的存放路径 */
        [[NSFileManager defaultManager] removeItemAtPath:webKitFolderInCaches error:&error];
        [[NSFileManager defaultManager] removeItemAtPath:webkitFolderInLib error:nil];
        /* iOS7.0 WebView Cache的存放路径 */
        [[NSFileManager defaultManager] removeItemAtPath:webKitFolderInCachesfs error:&error];
        
        NSString *cookiesFolderPath = [libraryDir stringByAppendingString:@"/Cookies"];
        [[NSFileManager defaultManager] removeItemAtPath:cookiesFolderPath error:&error];
        [[NSURLCache sharedURLCache] removeAllCachedResponses];
    }
}

//获取明天时间
+ (NSString *)fq_getTomorrowDayWithDateFormat:(NSString *)format
{
    NSDate *date = [NSDate date];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorian components:NSCalendarUnitWeekday | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:date];
    [components setDay:([components day]+1)];
    
    NSDate *beginningOfWeek = [gregorian dateFromComponents:components];
    NSDateFormatter *dateday = [[NSDateFormatter alloc] init];
    [dateday setDateFormat:format];
    return [dateday stringFromDate:beginningOfWeek];
}
//字符串转日期格式
- (NSDate *)fq_stringToDate:(NSString *)dateString withDateFormat:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSDate *date = [dateFormatter dateFromString:dateString];
    return [self fq_worldTimeToChinaTime:date];
}

//将世界时间转化为中国区时间
- (NSDate *)fq_worldTimeToChinaTime:(NSDate *)date
{
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    NSInteger interval = [timeZone secondsFromGMTForDate:date];
    NSDate *localeDate = [date  dateByAddingTimeInterval:interval];
    return localeDate;
}
//判断两个时间大小
+ (int)fq_compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *oneDayStr = [dateFormatter stringFromDate:oneDay];
    NSString *anotherDayStr = [dateFormatter stringFromDate:anotherDay];
    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    NSComparisonResult result = [dateA compare:dateB];
    //    NSLog(@"date1 : %@, date2 : %@", oneDay, anotherDay);
    if (result == NSOrderedDescending) {
        //NSLog(@"Date1  is in the future");
        //大于
        return 1;
    }
    else if (result == NSOrderedAscending){
        //NSLog(@"Date1 is in the past");
        //小于
        return -1;
    }
    //NSLog(@"Both dates are the same");
    //等于
    return 0;
    
}

//通过字符串计算label大小
//size 固定高，宽就设置无限大，固定宽，高就设置无线大
+ (CGRect)fq_getLabelRectWithString:(NSString *)string andSize:(CGSize)size andFont:(UIFont *)font
{
    NSDictionary *dic=@{NSFontAttributeName:font};
    CGRect rect=[string boundingRectWithSize:CGSizeMake(size.width, size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    return rect;
}
//判断时间在某个时间段内
+ (BOOL)fq_compareDate:(NSDate*)date isBeginDate:(NSDate*)beginDate andEndDate:(NSDate*)endDate
{
    if ([date compare:beginDate] == NSOrderedAscending)
        return NO;
    
    if ([date compare:endDate] == NSOrderedDescending)
        return NO;
    
    return YES;
}
//获取某个时间某天后的时间
+ (NSString *)fq_getSomeDayWithDate:(NSDate *)date Num:(int)num DateFormat:(NSString *)format
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorian components:NSCalendarUnitWeekday | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:date];
    [components setDay:([components day]+num)];
    
    NSDate *beginningOfWeek = [gregorian dateFromComponents:components];
    NSDateFormatter *dateday = [[NSDateFormatter alloc] init];
    [dateday setDateFormat:format];
    return [dateday stringFromDate:beginningOfWeek];
}
//将NSDate按格式时间输出NSString
+ (NSString*)fq_dateToString:(NSDate *)date withFormat:(NSString *)format;
{
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:format];
    NSString* string=[dateFormat stringFromDate:date];
    return string;
}
//计算两个时间之间差几天
+(NSInteger)fq_getDaysFrom:(NSDate *)serverDate To:(NSDate *)endDate
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [gregorian setFirstWeekday:7];
    //去掉时分秒信息
    NSDate *fromDate;
    NSDate *toDate;
    [gregorian rangeOfUnit:NSCalendarUnitDay startDate:&fromDate interval:NULL forDate:serverDate];
    [gregorian rangeOfUnit:NSCalendarUnitDay startDate:&toDate interval:NULL forDate:endDate];
    NSDateComponents *dayComponents = [gregorian components:NSCalendarUnitDay fromDate:fromDate toDate:toDate options:0];
    
    return dayComponents.day;
}
+ (NSDate *)fq_getLocalDate:(NSDate *)date {
    //设置源日期时区
    NSTimeZone* sourceTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];//或GMT
    //设置转换后的目标日期时区
    NSTimeZone* destinationTimeZone = [NSTimeZone localTimeZone];
    //得到源日期与世界标准时间的偏移量
    NSInteger sourceGMTOffset = [sourceTimeZone secondsFromGMTForDate:date];
    //目标日期与本地时区的偏移量
    NSInteger destinationGMTOffset = [destinationTimeZone secondsFromGMTForDate:date];
    //得到时间偏移量的差值
    NSTimeInterval interval = destinationGMTOffset - sourceGMTOffset;
    //转为现在时间
    NSDate* destinationDateNow = [[NSDate alloc] initWithTimeInterval:interval sinceDate:date];
    return destinationDateNow;
}
// 查找路径及其子路径下所有指定类型文件
+ (NSMutableArray *)fq_findAllFileWithType:(NSString *)type andPath:(NSString *)path{
    
    NSFileManager *manager = [NSFileManager defaultManager];
    //深度遍历路径及其子路径下所有文件以及文件夹
    NSDirectoryEnumerator *dirEnum = [manager enumeratorAtPath:path];
    //文件及文件夹名称数组
    NSMutableArray *fileNameListArray = [NSMutableArray array];
    //路径下所有文件和文件夹
    NSString *allPath;
    while ((allPath = [dirEnum nextObject]) != nil)
    {
        [fileNameListArray addObject:allPath];
    }
    //所需文件数组
    NSMutableArray *fileArray = [NSMutableArray array];
    //遍历所有所有文件和文件夹名称数组
    [fileNameListArray enumerateObjectsUsingBlock:^(NSString *filePath, NSUInteger idx, BOOL * _Nonnull stop) {
        //后缀名称
        NSString *lastPath = [filePath pathExtension];
        //判断后缀名称是否是需要类型
        if([lastPath isEqualToString:type]){
            //是
            [fileArray addObject:[NSString stringWithFormat:@"%@/%@",path,filePath]];
        }else{
            //不是
        }
    }];
    return fileArray;
}

+ (NSMutableArray *)fq_findAllFolderWithType:(NSString *)type andPath:(NSString *)path{
    NSFileManager *manager = [NSFileManager defaultManager];
    //深度遍历路径及其子路径下所有文件以及文件夹
    NSDirectoryEnumerator *dirEnum = [manager enumeratorAtPath:path];
    //文件及文件夹名称数组
    NSMutableArray *fileNameListArray = [NSMutableArray array];
    //路径下所有文件和文件夹
    NSString *allPath;
    while ((allPath = [dirEnum nextObject]) != nil)
    {
        [fileNameListArray addObject:allPath];
    }
    //所需文件数组
    NSMutableArray *fileArray = [NSMutableArray array];
    //遍历所有所有文件和文件夹名称数组
    [fileNameListArray enumerateObjectsUsingBlock:^(NSString *filePath, NSUInteger idx, BOOL * _Nonnull stop) {
        //后缀名称
        NSString *lastPath = [filePath pathExtension];
        //判断后缀名称是否是需要类型
        if([lastPath isEqualToString:type]){
            //是
            [fileArray addObject:path];
        }else{
            //不是
        }
    }];
    return fileArray;
}
//判断是不是首次登录或者版本更新
+(BOOL )fq_isFirstLaunch{
    //获取当前版本号
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *currentAppVersion = infoDic[@"CFBundleShortVersionString"];
    //获取上次启动应用保存的appVersion
    NSString *version = [[NSUserDefaults standardUserDefaults] objectForKey:kAppVersion];
    //版本升级或首次登录
    if (version == nil || ![version isEqualToString:currentAppVersion]) {
        [[NSUserDefaults standardUserDefaults] setObject:currentAppVersion forKey:kAppVersion];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return YES;
    }else{
        return NO;
    }
}
/**
 判断是不是第一次进入某个页面
 */
+(BOOL)fq_isFirstWithClassName:(NSString *)className{
    NSString *version = [[NSUserDefaults standardUserDefaults] objectForKey:className];
    if (version == nil) {
        [[NSUserDefaults standardUserDefaults] setObject:@"isFirst" forKey:className];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return YES;
    }else{
        return NO;
    }
}

#pragma mark -获取当前屏幕显示的viewcontroller
+ (UIViewController *)fq_getCurrentViewController
{
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal){
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for (UIWindow * tmpWin in windows) {
            if (tmpWin.windowLevel == UIWindowLevelNormal){
                window = tmpWin;
                break;
            }
        }
    }
    UIViewController *result = window.rootViewController;
    while (result.presentedViewController) {
        result = result.presentedViewController;
    }
    if ([result isKindOfClass:[UITabBarController class]]) {
        result = [(UITabBarController *)result selectedViewController];
    }
    if ([result isKindOfClass:[UINavigationController class]]) {
        result = [(UINavigationController *)result topViewController];
    }
    return result;
    
}
#pragma mark -获取当前屏幕中present出来的viewcontroller
+ (UIViewController *)fq_getPresentedViewController
{
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = appRootVC;
    if (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    
    return topVC;
}


@end
