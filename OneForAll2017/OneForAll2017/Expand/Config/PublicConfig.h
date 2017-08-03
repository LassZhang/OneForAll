//
//  PublicConfig.h
//  OneForAll2017
//
//  Created by dany on 2017/8/3.
//  Copyright © 2017年 Joseph. All rights reserved.
//
/**
 *该文件内主要是:
 * 常用的宏编译方法
 * 宏常量
 */
#ifndef PublicConfig_h
#define PublicConfig_h

/* 字符串是否为空 */
#define StrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref)isEqualToString:@""]))

/* 是否为空或是[NSNull null] */
#define NilOrNull(_ref)   (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) || ([(_ref) isEqual:@"null"]) || ([(_ref) isEqual:@"(null)"]))

/* 16进制颜色转化 */
#define HexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

// 颜色
#define COLOR(String) [REDCommonTools colorWithHexString:String]
#define GlobalRED   COLOR(@"#d13b3b")  // 统一背景红色

//色值
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

/* 常用frame */
#define BOUNDS [[UIScreen mainScreen] bounds]
#define SCREEN_Width    ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_Height   ([UIScreen mainScreen].bounds.size.height)

/* 区分屏幕 */
#define IPHONE5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define IPHONE4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define IPHONE6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define IPHONE6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

/* 显示打印行 */
#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr, "[%s:%d行] %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

//弱引用/强引用  可配对引用在外面用MPWeakSelf(self)，block用MPStrongSelf(self)  也可以单独引用在外面用MPWeakSelf(self) block里面用weakself
#define MPWeakSelf(type)  __weak typeof(type) weak##type = type;
#define MPStrongSelf(type)  __strong typeof(type) type = weak##type;


//获取temp
#define kPathTemp NSTemporaryDirectory()
//获取沙盒 Document
#define kPathDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒 Cache
#define kPathCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

//不同屏幕尺寸字体适配
#define iPhone6WidthScale  (SCREEN_Width / 375.0)
#define iPhone6HeightScale (SCREEN_Height / 667.0)
#define AdaptedWidth(x)  ceilf((x) * iPhone6WidthScale)
#define AdaptedHeight(x) ceilf((x) * iPhone6HeightScale)
#define AdaptedFontSize(R)     CHINESE_SYSTEM(AdaptedWidth(R))
#define AdaptedBoldFontSize(R) CHINESE_BOLD(AdaptedWidth(R))

//  圆角和边框
#define ViewBorderRadiusColor(view,radius,width,color)\
[view.layer setCornerRadius:(radius)];\
[view.layer setMasksToBounds:YES];\
[view.layer setBorderWidth:(width)];\
[view.layer setBorderColor:[color CGColor]];

//一些缩写
#define kApplication        [UIApplication sharedApplication]
#define kKeyWindow          [UIApplication sharedApplication].keyWindow
#define kUserDefaults       [NSUserDefaults standardUserDefaults]
#define kNotificationCenter [NSNotificationCenter defaultCenter]

#endif /* PublicConfig_h */
