//
//  DouBanTabBar.m
//  Lesson-douban
//
//  Created by ss on 16/6/28.
//  Copyright © 2016年 ss. All rights reserved.
//

#import "VideoTabBar.h"

@implementation VideoTabbar
- (instancetype)initWithItems:(NSArray *)items frame:(CGRect)frame{
    self = [super init];
    if (self) {
        self.frame = frame;
        
        for (int i = 0; i<items.count; i++) {
            UIButton *btn = (UIButton *)items[i];
            CGFloat width = self.bounds.size.width / items.count;
            CGFloat height = self.bounds.size.height;
            btn.frame = CGRectMake(i * width, 0, width, height);
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:(UIControlEventTouchUpInside)];
            
            [self addSubview:btn];
            
        }
        self.currentSelected = 0;
        self.currentSelectedItem = items[0];
        self.allItems = items;
        
    }
    
    return self;
    
}
- (void)btnClick:(UIButton *)btn{
    
    self.currentSelectedItem = btn;
    for (int i = 0; i< self.allItems.count; i++) {
        UIButton *tempBtn = (UIButton *)self.allItems[i];
        if (btn == tempBtn) {
            self.currentSelected = i;
            tempBtn.selected = YES;
            
        }else{
            tempBtn.selected = NO;
            
        }
    }
    if (_vedionDelegate) {

        [_vedionDelegate douBanItemDidClicked:self];
    }
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
