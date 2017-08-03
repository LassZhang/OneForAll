//
//  CommonTools.m
//  OneForAll2017
//
//  Created by dany on 2017/8/3.
//  Copyright © 2017年 Joseph. All rights reserved.
//

#import "CommonTools.h"

@implementation CommonTools
+ (void)setObjectValue:(id)obj forKey:(NSString *)key
{
    [self removeValueForKey:key];
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:obj forKey:key];
    [userDefault synchronize];
}

+ (id)getObjectValueForKey:(NSString *)key
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    id value = [userDefault objectForKey:key];
    return value;
}

+ (void)setBoolValue:(BOOL)obj forKey:(NSString *)key
{
    [self removeValueForKey:key];
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setBool:obj forKey:key];
    [userDefault synchronize];
}

+ (BOOL)getBoolValueForKey:(NSString *)key
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    BOOL value = [userDefault boolForKey:key];
    return value;
}

+ (void)removeValueForKey:(NSString *)key
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault removeObjectForKey:key];
    [userDefault synchronize];
}

+ (id)getCustomObjectForKey:(NSString *)key
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSData * dataobject = [userDefault objectForKey:key];
    
    //add by hgc 2016年10月25日
    NSLog(@"--%@", key);
    
    NSLog(@"--%@", dataobject);
    
    id object = [NSKeyedUnarchiver unarchiveObjectWithData:dataobject];
    return object;
}

+ (void)setCustomObject:(id)obj forKey:(NSString *)key
{
    NSData * dataobject = [NSKeyedArchiver archivedDataWithRootObject:obj];
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [self removeValueForKey:key];
    [userDefault setObject:dataobject forKey:key];
    [userDefault synchronize];
}

+ (BOOL)validatePhone:(NSString *)phoneNum {
    
    NSString *string = [phoneNum stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (string.length > 0) {
        NSString *str = [string substringToIndex:1];
        if (string.length == 11) {
            if ([str isEqualToString:@"1"]) {
                return YES;
            } else {
                return NO;
            }
        } else {
            return NO;
        }
    }else{
        return NO;
    }
    
}
// 密码 8 - 20 位数字字母组合
+ (BOOL)checkPassword:(NSString *) password
{
    NSString *pattern = @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9.]{8,20}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:password];
    return isMatch;
    
}
#pragma mark - 判断密码安全性
+ (BOOL)judgePassword:(NSString *)password {
    
    BOOL nums = NO;
    BOOL en = NO;
    BOOL fuhao = NO;
    for (int i = 0 ; i < password.length; i ++) {
        char chs = [password characterAtIndex:i];
        int ch = chs;
        if (!nums && (ch <= 57 && ch >= 48)) {
            nums = YES;
        }
        if (!en && ((ch >=65 && ch <= 90) || (ch >=97 && ch <= 122))) {
            en = YES;
        }
        
        if (!fuhao && ((ch >=32 && ch <= 47) || (ch >=58 && ch <= 64)|| (ch >=91 && ch <= 96)|| (ch >=123 && ch <= 126))) {
            fuhao = YES;
        }
    }
    
    if ((nums == YES && en == YES) || (nums == YES && fuhao == YES) || (fuhao == YES && en == YES) || (nums == YES && en == YES && fuhao == YES)) {
        
        return YES;
    } else {
        return NO;
    }
    
}

// 最少 6 位
+ (BOOL)judgePsd:(NSString *)psdString {
    if (psdString != 0) {
        BOOL result = [CommonTools judgePassword:psdString];
        if (result && psdString.length >= 6) {
            return YES;
        } else {
            return NO;
        }
    } else {
        return NO;
    }
}

#pragma mark - 检测密码安全性
+ (BOOL)checkPasswordForSafe:(NSString *)password{
    BOOL nums = NO;
    BOOL en = NO;
    BOOL fuhao = NO;
    if (password.length > 20 || password.length < 6) {
        
        return NO;
    }
    for (int i = 0 ; i < password.length; i ++) {
        char chs = [password characterAtIndex:i];
        int ch = chs;
        if (!nums && (ch <= 57 && ch >= 48)) {
            nums = YES;
        }
        if (!en && ((ch >=65 && ch <= 90) || (ch >=97 && ch <= 122))) {
            en = YES;
        }
        
        if (!fuhao && ((ch >=32 && ch <= 47) || (ch >=58 && ch <= 64)|| (ch >=91 && ch <= 96)|| (ch >=123 && ch <= 126))) {
            fuhao = YES;
        }
    }
    
    if ((nums == YES && en == YES) || (nums == YES && fuhao == YES) || (fuhao == YES && en == YES) || (nums == YES && en == YES && fuhao == YES)) {
        
        return YES;
    } else {
        return NO;
    }
}
@end
