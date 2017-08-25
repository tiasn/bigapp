//
//  TXMacro.h
//  BigApp
//
//  Created by LTX on 2017/7/7.
//  Copyright © 2017年 LTX. All rights reserved.
//

#import <Foundation/Foundation.h>


/*
 *  系统相关宏定义
 */
#define kScreenWidth   CGRectGetWidth([[UIScreen mainScreen] bounds])  //获取屏幕宽度
#define kScreenHeight  CGRectGetHeight([[UIScreen mainScreen] bounds]) //获取屏幕高度

#define kTabBarHeight  49       //定义Tabbar高度

/**
 *  颜色处理
 */
#define Hex(rgbValue) ([UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0])


#define force_inline __inline__ __attribute__((always_inline))

static NSString *const kSectionFooter = @"UICollectionElementKindSectionFooter";
static NSString *const kSectionHeader = @"UICollectionElementKindSectionHeader";

//--------------------------- 【屏幕适配】 ------------------------------//

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height
#define iphone6P (kScreenH == 736)
#define iphone6 (kScreenH == 667)
#define iphone5 (kScreenH == 568)
#define iphone4 (kScreenH == 480)

//--------------------------- 【颜色】 ------------------------------//

#define TXRGB(r,g,b)    TXRGBA(r,g,b,1.0)
#define TXRGBA(r,g,b,a) [UIColor colorWithRed:(r) / 256.0 green:(g) / 256.0 blue:(b) / 256.0 alpha:a]
#define TXRandomColor   [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0];
#define TXUnifiedBgColor RGB(206, 206, 206)
#define TXClearColor [UIColor clearColor]

// 获取Caches缓存文件夹路径
#define CachesPath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]



//--------------------------- 【自定义Log打印日志】 ------------------------------//
//

#ifdef  DEBUG // 测试
#define TXLog(...) NSLog(__VA_ARGS__)
#define TXFunc  TXLog(@"%s",__func__)
#define TXFuncline TXLog(@"%s, line = %d, %@",__FUNCTION__,__LINE__,[NSThread currentThread]);

#else   // 发布
#define TXLog(...)
#define TXFunc
#define TXFuncline
#endif




@interface TXMacro : NSObject

@end
