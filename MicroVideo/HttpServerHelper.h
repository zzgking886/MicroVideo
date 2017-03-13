//
//  HttpServerHelper.h
//  testBlock
//
//  Created by 张振钢 on 14-9-3.
//  Copyright (c) 2014年 张振钢. All rights reserved.
//

typedef enum : int {
    HTTP_POST,
    HTTP_GET,
} HTTP_TYPE;

#import <Foundation/Foundation.h>

typedef void(^HttpFinishBlock)(id resultData, BOOL isError);

@interface HttpServerHelper : NSObject <NSURLSessionDelegate, NSURLSessionDataDelegate>

@property (strong, nonatomic) NSMutableData *resultData;
@property (strong, nonatomic) HttpFinishBlock finishBlock;
@property (strong, nonatomic) NSString *localHttpUrl;

+ (void)httpRequestWithUrl:(NSString *)httpUrl
            andRequestType:(HTTP_TYPE)requestType
              andParamters:(NSDictionary *)paramters
            andFinishBlock:(HttpFinishBlock)finishBlock;

@end
