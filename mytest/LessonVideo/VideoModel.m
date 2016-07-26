//
//  VideoModel.m
//  LessonVideo
//
//  Created by ss on 16/7/8.
//  Copyright © 2016年 ss. All rights reserved.
//

#import "VideoModel.h"

@implementation VideoModel
-(NSString *)description{
    
    return [NSString stringWithFormat:@"ID = %@",self.authorID];
    
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        _authorID = value;
    }
}

+ (NSMutableArray *)parseVideoWithDic:(NSDictionary *)dic{
    NSArray *videos = [dic objectForKey:@"videos"];
    NSMutableArray *returnArray = [NSMutableArray array];
    for (NSDictionary *tempDic in videos) {
        VideoModel *model = [[VideoModel alloc]init];
        [model setValuesForKeysWithDictionary:tempDic];
        [returnArray addObject:model];
    }
    return returnArray;
    
}

@end
