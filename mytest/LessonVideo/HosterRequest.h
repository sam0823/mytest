//
//  HosterRequest.h
//  LessonVideo
//
//  Created by ss on 16/7/7.
//  Copyright © 2016年 ss. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HosterRequest : NSObject
+ (instancetype)shareHosterRequest;

-(void)requestDotaAllHosterSuccess:(SuccessResponse)success
                           failure:(FailureResponse)failure;

-(void)requestLOLAllHosterSuccess:(SuccessResponse)success
                          failure:(FailureResponse)failure;



@end
