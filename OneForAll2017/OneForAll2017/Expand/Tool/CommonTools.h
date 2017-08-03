//
//  CommonTools.h
//  OneForAll2017
//
//  Created by dany on 2017/8/3.
//  Copyright © 2017年 Joseph. All rights reserved.
//
/**
 *该类提供常用工具服务
 * 手机号\邮箱\身份证 等判断
 * 颜色转换
 * 判断用户名\密码等规范等等
 *
 */
#import <Foundation/Foundation.h>

@interface CommonTools : NSObject

/*
 * UserDefault存储,不支持自定义对象 */
+ (void)setObjectValue:(id)obj forKey:(NSString *)key;

+ (id)getObjectValueForKey:(NSString *)key;

+ (void)setBoolValue:(BOOL)obj forKey:(NSString *)key;

+ (BOOL)getBoolValueForKey:(NSString *)key;

+ (void)removeValueForKey:(NSString *)key;

+ (void)removeAllUserInfo;

/*
 * UserDefault存储,自定义对象 */
+ (id)getCustomObjectForKey:(NSString *)key;
+ (void)setCustomObject:(id)obj forKey:(NSString *)key;

// 验证手机号的合法性
+ (BOOL)validatePhone:(NSString *)phoneNum;

// 判断密码安全强度
+ (BOOL)checkPassword:(NSString *)password;
+ (BOOL)judgePsd:(NSString *)psdString;

// 判断密码安全性(字符-字母-数字任意两种组合,6-20位)
+ (BOOL)checkPasswordForSafe:(NSString *)password;

@end
