//
//  HosterRequest.m
//  LessonVideo
//
//  Created by ss on 16/7/7.
//  Copyright © 2016年 ss. All rights reserved.
//

#import "HosterRequest.h"
#import "NetworkRequest.h"
#import "RequestUrl.h"
static HosterRequest *request = nil;

@implementation HosterRequest
+ (instancetype)shareHosterRequest{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        request = [[HosterRequest alloc]init];
    });
    return request;
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        request = [super allocWithZone:zone];
    });
    return request;
}


+ (id)copyWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        request = [super allocWithZone:zone];
    });
    return request;
}

-(void)requestAllHosterWithUrl:(NSString *)url
                       success:(SuccessResponse)success
                       failure:(FailureResponse)failure{
    NetworkRequest *request = [[NetworkRequest alloc]init];
    [request  requestWithUrl:url parameters:nil successResponse:^(NSDictionary *dic) {
        success(dic);
        
    } failureResponse:^(NSError *error) {
        failure(error);
        
    }];
    
}
-(void)requestDotaAllHosterSuccess:(SuccessResponse)success
                           failure:(FailureResponse)failure{
    [self requestAllHosterWithUrl:DotaAllHosterResquest_url success:^(NSDictionary *dic) {
        success(dic);
    } failure:^(NSError *error) {
        failure(error);
        
    }];
    
}

-(void)requestLOLAllHosterSuccess:(SuccessResponse)success
                          failure:(FailureResponse)failure{
    [self requestAllHosterWithUrl:LOLAllHosterRequest_url success:^(NSDictionary *dic) {
        success(dic);
    } failure:^(NSError *error) {
        failure(error);
    }];
    
}

@end
