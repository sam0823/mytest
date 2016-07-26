//
//  NetworkRequest.h
//  Lesson-douban
//
//  Created by ss on 16/6/27.
//  Copyright © 2016年 ss. All rights reserved.
//

#import "BaseRequest.h"
//成功回调
typedef void(^SuccessResponse)(NSDictionary *dic);
//失败回调
typedef void(^FailureResponse)(NSError *error);

@interface NetworkRequest : BaseRequest
+ (instancetype)defaultNewWorkRequest;
/**
 *  请求数据
 *
 *  @param url          请求数据的url
 *  @param parameterDic 请求的参数
 *  @param success      成功回调的block
 *  @param failure      失败回调的block
 */
- (void)requestWithUrl:(NSString *)url
           parameters:(NSDictionary *)parameterDic
      successResponse:(SuccessResponse)success
      failureResponse:(FailureResponse)failure;

-(void)sendDataWithUrl:(NSString *)url
            parameters:(NSDictionary *)parameterDic
       successResponse:(SuccessResponse)success
       failureResponse:(FailureResponse)failure;

-(void)sendImageWithUrl:(NSString *)url
             parameters:(NSDictionary *)parameterDic
                  image:(UIImage *)uploadImage
        successResponse:(SuccessResponse)success
        failureResponse:(FailureResponse)failure;

@end
