//
//  VedioDetailModel.h
//  LessonVideo
//
//  Created by ss on 16/7/8.
//  Copyright © 2016年 ss. All rights reserved.
//

#import "BaseModel.h"

@interface VedioDetailModel : BaseModel

//视频链接url
@property (nonatomic, strong) NSString *url;
//返回的消息
@property (nonatomic, strong) NSString *message;
//返回码
@property (nonatomic, strong) NSString *code;

//+ (NSMutableArray *)parseVideoDetailWithDic:(NSDictionary *)dic;

@property(nonatomic,strong)VedioDetailModel *vedioDetailmodel;

@end
