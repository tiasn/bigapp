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




@interface TXMacro : NSObject

@end
