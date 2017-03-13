//
//  HttpServerHelper.m
//  testBlock
//
//  Created by 张振钢 on 14-9-3.
//  Copyright (c) 2014年 张振钢. All rights reserved.
//

#import "HttpServerHelper.h"
#import "AppDelegate.h"

@implementation HttpServerHelper

+ (void)httpRequestWithUrl:(NSString *)httpUrl
            andRequestType:(HTTP_TYPE)requestType
              andParamters:(NSDictionary *)paramters
            andFinishBlock:(HttpFinishBlock)finishBlock
{
    if (requestType == HTTP_POST)
    {
        HttpServerHelper *httpServerHelper = [[HttpServerHelper alloc] init];
        httpServerHelper.finishBlock = finishBlock;
        
        NSURL *url = [NSURL URLWithString:httpUrl];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:15.0];
        [request setHTTPMethod:@"POST"];
        if ([paramters count] > 0)
        {
            NSArray *paramtersKey = [[NSArray alloc] initWithArray:[paramters allKeys]];
            NSString *strBody = @"";
            for (NSString *strKey in paramtersKey)
            {
                strBody = [strBody stringByAppendingFormat:@"%@=%@&",strKey,[paramters objectForKey:strKey]];
            }
            NSData *BodyData = [strBody dataUsingEncoding:NSUTF8StringEncoding];
            [request setHTTPBody:BodyData];
        }
        
        NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]
                                                              delegate:httpServerHelper
                                                         delegateQueue:[[NSOperationQueue alloc] init]];
        
        // 创建任务(因为要使用代理方法,就不需要block方式的初始化了)
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request];
        
        // 启动任务
        [task resume];
    }
    else
    {
        HttpServerHelper *httpServerHelper = [[HttpServerHelper alloc] init];
        httpServerHelper.finishBlock = finishBlock;
        httpServerHelper.localHttpUrl = httpUrl;

        
        
        httpServerHelper.resultData = [[NSMutableData alloc] init];
        NSURL *url = [NSURL URLWithString:httpUrl];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:15.0];
        [request setHTTPMethod:@"GET"];
        
        NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]
                                                              delegate:httpServerHelper
                                                         delegateQueue:[[NSOperationQueue alloc] init]];
        
        // 创建任务(因为要使用代理方法,就不需要block方式的初始化了)
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request];
        // 启动任务
        [task resume];
    }
}


#pragma mark - 
#pragma mark NSURLSession delegate
// 1.接收到服务器的响应
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler {
    // 允许处理服务器的响应，才会继续接收服务器返回的数据
    self.resultData = [[NSMutableData alloc] initWithCapacity:0];
    completionHandler(NSURLSessionResponseAllow);
}

// 2.接收到服务器的数据（可能调用多次）
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
    // 处理每次接收的数据
    [self.resultData appendData:data];
}

// 3.请求成功或者失败（如果失败，error有值）
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
    // 请求完成,成功或者失败的处理
    if (error == nil)
    {
//        NSLog(@"resultData = %s", [self.resultData bytes]);
        id jsonObject = [NSJSONSerialization JSONObjectWithData:self.resultData options:NSJSONReadingMutableLeaves error:nil];
        if (self.finishBlock) {
            self.finishBlock(jsonObject,NO);
        }
    }
    else
    {
        if (self.finishBlock) {
            self.finishBlock([error description],YES);
        }
    }
    
}

@end
