//
//  VideoRequest.m
//  LessonVideo
//
//  Created by ss on 16/7/8.
//  Copyright © 2016年 ss. All rights reserved.
//

#import "VideoRequest.h"
#import "NetworkRequest.h"

static VideoRequest *request = nil;

@implementation VideoRequest


+ (instancetype)shareVideoRequest{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        request = [[VideoRequest alloc]init];
    });
    return request;
}

- (void)requestSingleHosterAllVideoWithUrl:(NSString *)url
                                   success:(SuccessResponse)success
                                   failure:(FailureResponse)failuer{
    NetworkRequest *request = [[NetworkRequest alloc]init];
    [request requestWithUrl:url parameters:nil successResponse:^(NSDictionary *dic) {
        success(dic);
    } failureResponse:^(NSError *error) {
        failuer(error);
    }];
    
}

-(void)requestDotaSingleHosterAllVideoWithID:(NSString *)ID success:(SuccessResponse)success failure:(FailureResponse)failure{
    
    [self requestSingleHosterAllVideoWithUrl:DotaSingleAuthorAllVideoRequest_Url(ID) success:^(NSDictionary *dic) {
        success(dic);
    } failure:^(NSError *error) {
        failure(error);
        
    }];
    
    
}


-(void)requestLOLSingleHosterAllVideoWithID:(NSString *)ID
                                    success:(SuccessResponse)success
                                    failure:(FailureResponse)failure{
    [self requestSingleHosterAllVideoWithUrl:LOLSingleAuthorAllVideoRequest_Url(ID) success:^(NSDictionary *dic) {
        success(dic);
    } failure:^(NSError *error) {
        failure(error);
        
    }];
    
}

@end
