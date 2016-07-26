//
//  VedioDetailRequest.m
//  LessonVideo
//
//  Created by ss on 16/7/9.
//  Copyright © 2016年 ss. All rights reserved.
//

#import "VedioDetailRequest.h"
static VedioDetailRequest *request = nil;

@implementation VedioDetailRequest

+ (instancetype)shareVideoRequest{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        request = [[VedioDetailRequest alloc]init];
    });
    return request;
}
- (void)requestSingleHosterAllVideoWithUrl:(NSString *)url
                                   success:(SuccessResponse)success
                                   failure:(FailureResponse)failuer{
//    NetworkRequest *request = [[NetworkRequest alloc]init];
    [[NetworkRequest defaultNewWorkRequest]requestWithUrl:url parameters:nil successResponse:^(NSDictionary *dic) {
        success(dic);
    } failureResponse:^(NSError *error) {
        failuer(error);
    }];
//    
//    [request requestWithUrl:url parameters:nil successResponse:^(NSDictionary *dic) {
//        success(dic);
//    } failureResponse:^(NSError *error) {
//        failuer(error);
//    }];
    
}

-(void)requestDotaAuthorSimpleVideoWithID:(NSString *)ID success:(SuccessResponse)success failure:(FailureResponse)failure{
    [self requestSingleHosterAllVideoWithUrl:DotaAuthorSimpleVideoRequest_url(ID) success:^(NSDictionary *dic) {
        success(dic);
    } failure:^(NSError *error) {
        failure(error);
    }];
    
}
-(void)requestLOLAuthorSimpleVideoWithID:(NSString *)ID success:(SuccessResponse)success failure:(FailureResponse)failure{
    [self requestSingleHosterAllVideoWithUrl:LOLAuthorSimpleRequest_url(ID) success:^(NSDictionary *dic) {
        success(dic);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

@end
