//
//  NSString+FQStringCategory.h
//  FQBaseKit
//
//  Created by mac on 2019/1/16.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSString (FQStringCategory)

/**
 电话验证

 @param mobileNum 电话号码
 @return 是否是电话
 */
+ (BOOL)isMobilePhoneOrtelePhone:(NSString *)mobileNum;

/**
 根据运营商的英文简写返回汉字
 
 @param shortString 英文简写
 @return 联通 电信 移动
 */
+ (NSString *)carrieropterWithShort:(NSString *)shortString;


/**
 手机号简易验证 仅验证手机号是1开头的11位数字
 
 @param phoneNum 手机号
 @return 是否是手机号
 */
+ (BOOL)fq_isMobilePhoneForSimpleVerificationPhone:(NSString *)phoneNum;

/**
 判断当前字符是否包含在限制字符串内
 
 @param limitString 限制字符串
 @return YES 在 NO  不在
 */
- (BOOL)shouldChangeCharaetersWithLimitString:(NSString *)limitString;


/**
 限制字符串的长度
 
 @param length 限制的长度
 @return limitString
 */
- (NSString *)limitStringLengthWithLength:(NSInteger)length;

/**
 判断是否是正确的手机号
 
 @return YES  是  NO 不是
 */
- (BOOL)isPhoneNo;
/**
 判断是否是正确的手机号
 
 @return YES  是  NO 不是
 */
- (BOOL)isPhoneNoNow;

/**
 判断是否是中国移动
 
 @return YES  是  NO 不是
 */
- (BOOL)isPhoneCHINAMOBILE;

/**
 判断是否是中国联通
 
 @return YES  是  NO 不是
 */
- (BOOL)isPhoneCHINAUNIFORM;

/**
 判断是否是中国电信
 
 @return YES  是  NO 不是
 */
- (BOOL)isPhoneCHINATELECOM;

/**
 
 */
- (NSString *)WhichPhoneNumOperator;

- (NSString *)whichPhoneNumType;
/**
 
 */
- (NSString *)DefalutPhoneNumOperator;


/**
 生成时间戳
 
 @return 时间戳
 */
+ (NSString *)timestamp;


/**
 md5加密
 
 @return 加密后的字符串
 */
- (NSString *)md5;


/**
 获取rid
 
 @return rid
 */
+ (NSString *)rid;


#pragma mark 清空字符串中的空白字符
- (NSString *)trimString;

/**
 生成指定格式的时间
 
 @param dateFormat 格式
 @return dateString
 */
- (NSString *)dateStringWithDateFormat:(NSString *)dateFormat;


/**
 密码校验
 
 @return YES 符合 NO 不符合
 */
- (BOOL)verifyPassword;


- (BOOL)passwordMinmumLength;

+ (NSString *)IPAddress:(BOOL)preferIPv4;

- (BOOL)isBlankString:(NSString *)string ;

- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;



@end

NS_ASSUME_NONNULL_END
