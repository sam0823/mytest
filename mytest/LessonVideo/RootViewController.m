//
//  RootViewController.m
//  Lesson-douban
//
//  Created by ss on 16/6/28.
//  Copyright © 2016年 ss. All rights reserved.
//

#import "RootViewController.h"
//#import "VideoTabBar.h"


@interface RootViewController ()<VideoTabbarDelegate>


@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.hidden = YES;

    [self button];
    
//    self.videoTabbar.vedionDelegate = self;
    self.videoTabbar.vedionDelegate = self;
    
    // Do any additional setup after loading the view.
}

-(UIButton *)setButton:(UIButton *)btn imageN:(NSString *)imageName imageH:(NSString *)imageHS title:(NSString *)title{
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:imageHS] forState:(UIControlStateSelected)];
    [btn setTitle:title forState:(UIControlStateNormal)];
    
    [btn setImageEdgeInsets:(UIEdgeInsetsMake(0, 20, 15, 0))];
    //title 的偏移量
    [btn setTitleEdgeInsets:(UIEdgeInsetsMake(0, -45, -30, 0))];
    //字体大小
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    // 设置按钮普通状态标题颜色
    [btn setTitleColor:[UIColor colorWithRed:0.33 green:0.21 blue:0.15 alpha:1.00] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithRed:0.91 green:0.83 blue:0.64 alpha:1.00] forState:(UIControlStateSelected)];
    
    return btn;
    
}


-(void)button{
    UIButton *btn1=[UIButton buttonWithType:UIButtonTypeCustom];
    [self setButton:btn1 imageN:@"first_normal" imageH:@"first_selected" title:@"主播"];
    
    UIButton *btn2=[UIButton buttonWithType:UIButtonTypeCustom];
    
    [self setButton:btn2 imageN:@"video" imageH:@"videoH" title:@"电影"];
    /*
        [btn2 setImage:[UIImage imageNamed:@"video"] forState:UIControlStateNormal];
    [btn2 setImage:[UIImage imageNamed:@"videoH"] forState:UIControlStateSelected];
    [btn2 setTitle:@"电影" forState:(UIControlStateNormal)];
    
     *  Button 自带 Image 属性的偏移量
     *
     *  @param top    距离上边缘的尺寸
     *  @param left   距离左边缘的尺寸
     *  @param bottom 距离下边缘的尺寸
     *  @param right  距离右边缘的尺寸
     *
     *  @return 图片的偏移距离
     
    [btn2 setImageEdgeInsets:(UIEdgeInsetsMake(0, 0, 15, 0))];
    //title 的偏移量
    [btn2 setTitleEdgeInsets:(UIEdgeInsetsMake(0, -60, -30, 0))];
    //字体大小
    btn2.titleLabel.font = [UIFont systemFontOfSize:14];
    // 设置按钮普通状态标题颜色
    [btn2 setTitleColor:[UIColor colorWithRed:0.33 green:0.21 blue:0.15 alpha:1.00] forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor colorWithRed:0.91 green:0.83 blue:0.64 alpha:1.00] forState:(UIControlStateHighlighted)];
    */
    
    UIButton *btn3=[UIButton buttonWithType:UIButtonTypeCustom];
    [self setButton:btn3 imageN:@"2image" imageH:@"2imageH" title:@"影院"];
//    
//    [btn3 setImage:[UIImage imageNamed:] forState:UIControlStateNormal];
//    [btn3 setImage:[UIImage imageNamed:] forState:UIControlStateSelected];
//    
    UIButton *btn4=[UIButton buttonWithType:UIButtonTypeCustom];
    [self setButton:btn4 imageN:@"second_normal" imageH:@"second_selected" title:@"我的"];
//    
//    [btn4 setImage:[UIImage imageNamed:] forState:UIControlStateNormal];
//    [btn4 setImage:[UIImage imageNamed:] forState:UIControlStateSelected];
//    
    self.videoTabbar=[[VideoTabbar alloc] initWithItems:@[btn1,btn4] frame:CGRectMake(0, WindowHeight - 49, WindownWidth, 49)];
    //    self.dbTabBar.frame=CGRectMake(0, 300, 414, 49);
    
    [self.view addSubview:self.videoTabbar];
}

-(void)douBanItemDidClicked:(VideoTabbar *)tabbar{
    self.selectedIndex = tabbar.currentSelected;
//    NSLog(@"%d,%lu",self.dbTabbar.currentSelected,(unsigned long)self.selectedIndex);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
