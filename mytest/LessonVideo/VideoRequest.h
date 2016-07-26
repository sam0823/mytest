//
//  VideoRequest.h
//  LessonVideo
//
//  Created by ss on 16/7/8.
//  Copyright © 2016年 ss. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VideoRequest : NSObject
+ (instancetype)shareVideoRequest;

- (void)requestDotaSingleHosterAllVideoWithID:(NSString *)ID
                                      success:(SuccessResponse)success
                                      failure:(FailureResponse)failure;
- (void)requestLOLSingleHosterAllVideoWithID:(NSString *)ID
                                    success:(SuccessResponse)success
                                    failure:(FailureResponse)failure;


@end
