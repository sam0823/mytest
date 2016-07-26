//
//  HostViewController.m
//  LessonVideo
//
//  Created by ss on 16/7/7.
//  Copyright © 2016年 ss. All rights reserved.
//

#import "HostViewController.h"
#import "HostTableViewCell.h"
#import "HosterRequest.h"
#import "HosterModel.h"
#import "VedioViewController.h"



@interface HostViewController ()
<
    UITableViewDataSource,
    UITableViewDelegate,
    UIScrollViewDelegate
>

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@property (weak, nonatomic) IBOutlet UITableView *LOLtableView;
@property (weak, nonatomic) IBOutlet UITableView *DotatableView;
@property (nonatomic,strong)NSMutableArray *dotaArray;
@property (weak, nonatomic) IBOutlet UIScrollView *scroller;
@property (nonatomic,strong)NSMutableArray *lolArray;
@end

@implementation HostViewController


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    self.segmentedControl.selectedSegmentIndex = self.scroller.contentOffset.x/414;
}
- (IBAction)segmentedControl:(UISegmentedControl *)sender {
    self.scroller.contentOffset=CGPointMake(sender.selectedSegmentIndex*414, 0);
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.dotaArray = [NSMutableArray array];
    self.lolArray = [NSMutableArray array];
    
    [self.LOLtableView registerNib:[UINib nibWithNibName:@"HostTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"LOL"];
    [self.DotatableView registerNib:[UINib nibWithNibName:@"HostTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"LOL"];
    [self requestDotaHoster];
    [self requestLOLHoster];
    
    // Do any additional setup after loading the view.
}
-(void)requestDotaHoster{
    HosterRequest *request = [[HosterRequest alloc]init];
    [request requestDotaAllHosterSuccess:^(NSDictionary *dic) {
        __weak typeof (self)weakself = self;
//        NSLog(@"%@",dic);
        weakself.dotaArray = [HosterModel parseHosterWithDic:dic];
        
//        NSArray *authors = dic[@"authors"];
//        for (NSDictionary *tempDic in authors) {
//            HosterModel *model = [[HosterModel alloc]init];
//            [model setValuesForKeysWithDictionary:tempDic];
//            [weakself.dotaArray addObject:model];
        
//        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakself.DotatableView reloadData];
            
        });
        
    } failure:^(NSError *error) {
         NSLog(@"error=%@",error);
    }];
    
}
-(void)requestLOLHoster{
    HosterRequest *request = [[HosterRequest alloc]init];
    [request requestLOLAllHosterSuccess:^(NSDictionary *dic) {
        __weak typeof (self)weakself = self;
        weakself.lolArray = [HosterModel parseHosterWithDic:dic];
        
//        NSArray *authors = dic[@"authors"];
//        for (NSDictionary *tempDic in authors) {
//            HosterModel *model = [[HosterModel alloc]init];
//            [model setValuesForKeysWithDictionary:tempDic];
//            [weakself.lolArray addObject:model];
        
//        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakself.LOLtableView reloadData];
            
        });
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
        
    }];
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HostTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LOL"];
//    HostTableViewCell *cell1 = [self.DotatableView dequeueReusableCellWithIdentifier:@"HostTableViewCell"];
    
    HosterModel *model = nil;
    if (tableView == self.DotatableView) {
        model = self.dotaArray[indexPath.row];
        
    }else{
        model = self.lolArray[indexPath.row];
        
    }
    cell.hosterModel = model;
    
    return cell;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.DotatableView) {
        return self.dotaArray.count;
    }else {
        return self.lolArray.count;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 65;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    VedioViewController *vedioVC = [sb instantiateViewControllerWithIdentifier:@"VedioViewController"];
    
    if (tableView ==self.DotatableView) {
        HosterModel *model = self.dotaArray[indexPath.row];
        vedioVC.ID = model.ID;
        vedioVC.sourceFrom = 1;
    }else{
        HosterModel *model = self.lolArray[indexPath.row];
        vedioVC.ID = model.ID;
        vedioVC.sourceFrom = 0;
    }
    self.rootVC.videoTabbar.hidden = YES;
    [self.navigationController pushViewController:vedioVC animated:YES];
//    self.rootVC.videoTabbar.hidden = NO;
    
}
-(void)viewWillAppear:(BOOL)animated{
    self.rootVC.videoTabbar.hidden = NO;
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
