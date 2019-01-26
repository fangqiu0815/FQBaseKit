//
//  NSDictionary+FQSafeAccess.h
//  FQBaseKit
//
//  Created by mac on 2019/1/16.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (FQSafeAccess)

- (BOOL)fq_hasKey:(NSString *)key;

- (NSString*)fq_stringForKey:(id)key;

- (NSNumber*)fq_numberForKey:(id)key;

- (NSDecimalNumber *)fq_decimalNumberForKey:(id)key;

- (NSArray*)fq_arrayForKey:(id)key;

- (NSDictionary*)fq_dictionaryForKey:(id)key;

- (NSInteger)fq_integerForKey:(id)key;

- (NSUInteger)fq_unsignedIntegerForKey:(id)key;

- (BOOL)fq_boolForKey:(id)key;

- (int16_t)fq_int16ForKey:(id)key;

- (int32_t)fq_int32ForKey:(id)key;

- (int64_t)fq_int64ForKey:(id)key;

- (char)fq_charForKey:(id)key;

- (short)fq_shortForKey:(id)key;

- (float)fq_floatForKey:(id)key;

- (double)fq_doubleForKey:(id)key;

- (long long)fq_longLongForKey:(id)key;

- (unsigned long long)fq_unsignedLongLongForKey:(id)key;

- (NSDate *)fq_dateForKey:(id)key dateFormat:(NSString *)dateFormat;

//CG
- (CGFloat)fq_CGFloatForKey:(id)key;

- (CGPoint)fq_pointForKey:(id)key;

- (CGSize)fq_sizeForKey:(id)key;

- (CGRect)fq_rectForKey:(id)key;

/**
 *  @brief NSDictionary转换成JSON字符串
 *
 *  @return  JSON字符串
 */
-(NSString *)fq_JSONString;

@end

#pragma --mark NSMutableDictionary setter

@interface NSMutableDictionary(FQSafeAccess)

-(void)fq_setObj:(id)i forKey:(NSString*)key;

-(void)fq_setString:(NSString*)i forKey:(NSString*)key;

-(void)fq_setBool:(BOOL)i forKey:(NSString*)key;

-(void)fq_setInt:(int)i forKey:(NSString*)key;

-(void)fq_setInteger:(NSInteger)i forKey:(NSString*)key;

-(void)fq_setUnsignedInteger:(NSUInteger)i forKey:(NSString*)key;

-(void)fq_setCGFloat:(CGFloat)f forKey:(NSString*)key;

-(void)fq_setChar:(char)c forKey:(NSString*)key;

-(void)fq_setFloat:(float)i forKey:(NSString*)key;

-(void)fq_setDouble:(double)i forKey:(NSString*)key;

-(void)fq_setLongLong:(long long)i forKey:(NSString*)key;

-(void)fq_setPoint:(CGPoint)o forKey:(NSString*)key;

-(void)fq_setSize:(CGSize)o forKey:(NSString*)key;

-(void)fq_setRect:(CGRect)o forKey:(NSString*)key;
@end


NS_ASSUME_NONNULL_END
