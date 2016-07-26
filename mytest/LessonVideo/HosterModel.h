//
//  HosterModel.h
//  LessonVideo
//
//  Created by ss on 16/7/7.
//  Copyright © 2016年 ss. All rights reserved.
//

#import "BaseModel.h"

@interface HosterModel : BaseModel
@property (nonatomic,strong)NSString *name;
@property (nonatomic,assign)BOOL watchable;
@property (nonatomic,strong)NSString *youku_id;
@property (nonatomic,strong)NSString *url;
@property (nonatomic,strong)NSString *detail;
@property (nonatomic,strong)NSString *ID;
@property (nonatomic,strong)NSString *pop;
@property (nonatomic,strong)NSString *icon;

+ (NSMutableArray *)parseHosterWithDic:(NSDictionary *)dic;

@end
