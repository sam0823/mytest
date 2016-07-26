//
//  VideoModel.h
//  LessonVideo
//
//  Created by ss on 16/7/8.
//  Copyright © 2016年 ss. All rights reserved.
//

#import "BaseModel.h"

@interface VideoModel : BaseModel
//视频截图
@property (nonatomic, strong) NSString *thumb;
//主播id
@property (nonatomic, strong) NSString *author;
//视频题目
@property (nonatomic, strong) NSString *title;
//时长
@property (nonatomic, strong) NSString *time;
//视频日期
@property (nonatomic, strong) NSString *date;
//视频id
@property (nonatomic, strong) NSString *authorID;

@property (nonatomic,strong)VideoModel *videoModel;

+ (NSMutableArray *)parseVideoWithDic:(NSDictionary *)dic;

@end
