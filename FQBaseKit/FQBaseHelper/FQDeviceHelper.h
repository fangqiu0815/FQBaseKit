//
//  FQDeviceHelper.h
//  FQBaseKitDemo
//
//  Created by mac on 2019/1/22.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FQDeviceHelper : NSObject

#pragma mark - 电池Battery
///获取电池电量(一般用百分数表示,大家自行处理就好)
+ (CGFloat)fq_getBatteryQuantity;

///获取电池状态(UIDeviceBatteryState为枚举类型)
+ (UIDeviceBatteryState)fq_getBatteryStauts;

/// mac地址
+ (NSString *)fq_macAddress;
/// //Return the current device CPU number
+ (NSUInteger)fq_cpuNumber;

#pragma mark - 屏幕亮度
///获取屏幕亮度(这个值介于0和1之间,且屏幕的亮度调节只能在真机上看到效果 在模拟器上看不到效果)
+ (CGFloat)fq_getScreenBrightness;

#pragma mark - 内存Memory & 磁盘容量
///获取总内存大小
+ (long long)fq_getTotalMemorySize;

///获取当前未使用(即可用)内存
+ (long long)fq_getAvailableMemorySize;

///获取已使用内存
+ (double)fq_getUsedMemory;

///获取总磁盘容量
+ (long long)fq_getTotalDiskSize;

///获取未使用(可用)磁盘容量
+ (long long)fq_getAvailableDiskSize;


#pragma mark - 手机型号
/**
 *  手机型号
 *  @brief:可以根据自己的需求增改。有人说也可以按照手机屏幕来判断，但5和5s/5c等手机屏幕相同尺寸则无法判断。。。我只做了iPhone的机型，所以iPad和iPod Touch的信息并没有更新到最新，也请朋友们补充。
 *
 *  @return 手机型号
 */
+ (NSString *)fq_getCurrentDeviceName;



#pragma mark - IP & WIFI
///根据域名host获取ip引入下面的头文件
+ (NSString *)fq_getIPAddressByHostName:(NSString *)hostName;

///获取手机IP地址
+ (NSString *)fq_getIPAddress;

/**
 *  获取当前手机连接的WIFI名称(即SSID)(SSID全称Service Set IDentifier, 即Wifi网络的公开名称)
 *  @brief  模拟器测试无效，始终为空，真机有效
 *
 */
+ (NSString *)fq_getWifiName;

/// 获取iOS系统的版本号
+ (NSString *)fq_systemVersion;
/// 判断当前系统是否有摄像头
+ (BOOL)fq_hasCamera;



@end

NS_ASSUME_NONNULL_END
