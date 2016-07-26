//
//  HosterModel.m
//  LessonVideo
//
//  Created by ss on 16/7/7.
//  Copyright © 2016年 ss. All rights reserved.
//

#import "HosterModel.h"

@implementation HosterModel
-(NSString *)description{
    
    return [NSString stringWithFormat:@"ID = %@",self.ID];
    
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        _ID = value;
    }
}

+ (NSMutableArray *)parseHosterWithDic:(NSDictionary *)dic{
    NSArray *tempArray = [dic objectForKey:@"authors"];
    NSMutableArray *returnArray = [NSMutableArray array];
    for (NSDictionary *tempDic in tempArray) {
        HosterModel *model = [[HosterModel alloc]init];
        [model setValuesForKeysWithDictionary:tempDic];
        [returnArray addObject:model];
        
    }
    return returnArray;
    
}

@end
