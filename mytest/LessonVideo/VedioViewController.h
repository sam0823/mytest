//
//  VedioViewController.h
//  LessonVideo
//
//  Created by ss on 16/7/8.
//  Copyright © 2016年 ss. All rights reserved.
//

#import "BaseViewController.h"

@interface VedioViewController : BaseViewController
@property(copy,nonatomic)NSString *ID;
//判断来源(从dota点击进来还是从LOL点击进来)
@property (nonatomic,assign)int sourceFrom;

@end
