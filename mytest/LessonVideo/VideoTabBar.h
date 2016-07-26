//
//  DouBanTabBar.h
//  Lesson-douban
//
//  Created by ss on 16/6/28.
//  Copyright © 2016年 ss. All rights reserved.
//


@class VideoTabbar;

@protocol VideoTabbarDelegate

-(void)douBanItemDidClicked:(VideoTabbar *)tabbar;

@end

#import <UIKit/UIKit.h>


@interface VideoTabbar : UITabBar

//当前选中的第几个item下标
@property (nonatomic,assign)int currentSelected;

//当前选中的item
@property (nonatomic,strong)UIButton *currentSelectedItem;

//tabbar所有的item
@property (nonatomic,strong)NSArray *allItems;

//自定义一个代理方法
@property(nonatomic,weak)id<VideoTabbarDelegate>vedionDelegate;


//初始化方法:根据items初始化items
- (instancetype)initWithItems:(NSArray *)items frame:(CGRect)frame;


@end
