//
//  TXBaseRequest.h
//  BigApp
//
//  Created by LTX on 2017/7/5.
//  Copyright © 2017年 LTX. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, TXHTTPType){
    TXHTTPTypeGET,
    TXHTTPTypePOST,
};


typedef void(^TXHTTPRequestCompletion)(id responseObject, NSString *message, BOOL success);


@interface TXBaseRequest : NSObject

/**
 *  配置请求地址
 */
+ (instancetype)requestWithURL:(NSString *)url;


/**
 *  发送网络请求
 *  @param methodType 请求方式 GET POST
 *  @param params 传入参数
 *  @param completion 请求完成回调
 */
- (NSURLSessionDataTask *)startWithMethod:(TXHTTPType)methodType
                                   params:(id)params
                               completion:(TXHTTPRequestCompletion)completion;

@end
