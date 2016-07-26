//
//  VedioDetailRequest.h
//  LessonVideo
//
//  Created by ss on 16/7/9.
//  Copyright © 2016年 ss. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VedioDetailRequest : NSObject
+ (instancetype)shareVideoRequest;

- (void)requestDotaAuthorSimpleVideoWithID:(NSString *)ID
                                   success:(SuccessResponse)success
                                   failure:(FailureResponse)failure;
- (void)requestLOLAuthorSimpleVideoWithID:(NSString *)ID
                                  success:(SuccessResponse)success
                                  failure:(FailureResponse)failure;
@end
