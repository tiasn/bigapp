//
//  TXBaseRequest.m
//  BigApp
//
//  Created by LTX on 2017/7/5.
//  Copyright © 2017年 LTX. All rights reserved.
//

#import "TXBaseRequest.h"
#import "AFNetworking.h"


@interface TXBaseRequest ()

@property (nonatomic, copy) NSString *urlString;

@property (nonatomic , copy) TXHTTPRequestCompletion completionBlock;

@property (nonatomic , strong) AFHTTPSessionManager *sessionManager;



@end

@implementation TXBaseRequest

/**
 *  配置请求地址
 */
+ (instancetype)requestWithURL:(NSString *)url {

    TXBaseRequest *request = [[TXBaseRequest alloc] init];
    request.urlString = url;
    
    return request;
    
}

/**
 *  发送网络请求
 *  @param methodType 请求方式 GET POST
 *  @param params 传入参数
 *  @param completion 请求完成回调
 */
- (NSURLSessionDataTask *)startWithMethod:(TXHTTPType)methodType params:(id)params completion:(TXHTTPRequestCompletion)completion {
    
    
    
    NSURLSessionDataTask *task = nil;
    self.completionBlock = completion;
    self.sessionManager = [self sessionManagerWithParams:params];

    if (methodType == TXHTTPTypeGET) {
        
        task = [self.sessionManager GET:[self.urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            if (self.completionBlock) {
                self.completionBlock(responseObject, nil, YES);
            }
        
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
            if (self.completionBlock) {
                self.completionBlock(nil, nil, NO);
            }
            
        }];
    }else if (methodType == TXHTTPTypePOST) {
    
        task = [self.sessionManager POST:[self.urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (self.completionBlock) {
                self.completionBlock(responseObject, nil, YES);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (self.completionBlock) {
             self.completionBlock(nil, error.description, NO);
                
            }
        }];
    
    }


    return nil;

}

/**
 *  初始化AFHTTPSessionManager
 */
- (AFHTTPSessionManager *)sessionManagerWithParams:(NSDictionary *)params {
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    config.timeoutIntervalForRequest = 30.0f;
    
    AFHTTPSessionManager *sessionManager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:config];
    
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/plain", @"text/json", @"text/javascript", @"text/html", nil];
    
    return sessionManager;
    
}


@end
