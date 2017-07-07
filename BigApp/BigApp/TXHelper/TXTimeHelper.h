//
//  TXTimeHelper.h
//  BigApp
//
//  Created by LTX on 2017/7/7.
//  Copyright © 2017年 LTX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TXTimeHelper : NSObject

/**
 *  返回早安、午安、晚安
 */
+ (NSString *)getHelloStringByLocalTime;

+ (NSString *)dataStringFromTimeInterval:(NSTimeInterval)time dataFormatter:(NSString *)formatter;

+ (NSString *)dataStringWithTimeInterval:(NSTimeInterval)time;

@end
