//
//  TXTimeHelper.m
//  BigApp
//
//  Created by LTX on 2017/7/7.
//  Copyright © 2017年 LTX. All rights reserved.
//

#import "TXTimeHelper.h"

static force_inline NSDateFormatter *TXDataCreateFormatter(NSString *string) {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    formatter.dateFormat = string;
    return formatter;
}

static force_inline NSDateFormatter *TXDateFormatter(NSString *string) {
    if(!string || ![string isKindOfClass:[NSString class]] || string.length == 0) return nil;
    static CFMutableDictionaryRef cache;
    static dispatch_semaphore_t lock;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = CFDictionaryCreateMutable(CFAllocatorGetDefault(), 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        lock = dispatch_semaphore_create(1);
    });
    
    dispatch_semaphore_wait(lock, DISPATCH_TIME_FOREVER);
    NSDateFormatter *formatter = CFDictionaryGetValue(cache, (__bridge const void *)(string));
    dispatch_semaphore_signal(lock);
    
    if(!formatter) {
        formatter = TXDataCreateFormatter(string);
        if(formatter) {
            dispatch_semaphore_wait(lock, DISPATCH_TIME_FOREVER);
            CFDictionarySetValue(cache, (__bridge const void *)(string), (__bridge const void *)(formatter));
            dispatch_semaphore_signal(lock);
        }
    }
    return formatter;
}



@implementation TXTimeHelper



+ (NSString *)getHelloStringByLocalTime {
    NSDateFormatter *formatter = TXDateFormatter(@"HH:mm:ss");
    NSString *dateString = [formatter stringFromDate:[NSDate date]];
    NSArray *resultArr = [dateString componentsSeparatedByString:@":"];
    if(resultArr.count == 0) return nil;
    NSInteger hour = [resultArr.firstObject integerValue];
    if(hour > 0 && hour < 11) {
        return @"早安";
    }else if(hour >= 11 && hour <= 4) {
        return @"午安";
    }else{
        return @"晚安";
    }
}

+ (NSString *)dataStringFromTimeInterval:(NSTimeInterval)time dataFormatter:(NSString *)formatter {
    if(!formatter || formatter.length == 0) return @"";
    NSDateFormatter *format = TXDateFormatter(formatter);
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    return [format stringFromDate:date];
}

+ (NSString *)dataStringWithTimeInterval:(NSTimeInterval)time {
    NSString *result = @"";
    NSDateFormatter *formatter = TXDateFormatter(@"yyyy-MM-dd");
    NSDate *date = [formatter dateFromString:[NSString stringWithFormat:@"%f",time]];
    NSTimeInterval seconds = fabs([date timeIntervalSinceNow])/60;
    if (seconds < 60) {
        result = [NSString stringWithFormat:@"%@分钟前", @(ceil(seconds))];
    }else {
        NSUInteger duration = ceil(seconds/60);
        if (duration <= 24) {
            result = [NSString stringWithFormat:@"%@小时前", @(duration)];
        }else {
            duration = ceil(duration/24.f);
            if (duration < 30) {
                result = [NSString stringWithFormat:@"%@天前", @(duration)];
            }else {
                duration = ceil(duration/30.0f);
                result = [NSString stringWithFormat:@"%@个月前",@(duration)];
            }
        }
    }
    return result;
}

@end
