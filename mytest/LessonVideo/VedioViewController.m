//
//  VedioViewController.m
//  LessonVideo
//
//  Created by ss on 16/7/8.
//  Copyright © 2016年 ss. All rights reserved.
//

#import "VedioViewController.h"
#import "AudioCollectionViewCell.h"
#import "VideoRequest.h"
#import "VideoModel.h"
//引入视频播放器框架
#import <AVFoundation/AVFoundation.h>
#import "PlayerView.h"

#import "VedioDetailRequest.h"
#import "VedioDetailModel.h"


@interface VedioViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,VedioCollectionViewCellDelegate>

//播放的playerview
@property (nonatomic,strong)PlayerView *playView;

//获得当前播放视频的cell
@property (nonatomic,strong)AudioCollectionViewCell *currentCell;


@property (weak, nonatomic) IBOutlet UICollectionView *showCollectionView;
//布局形式:
@property (nonatomic,assign) NSInteger layoutTitle;
@property (nonatomic,strong) NSMutableArray *videoArray;

//是否在播放
@property (nonatomic,assign) BOOL isPlaying;
//获取哪一行
@property (nonatomic,strong)NSIndexPath *currentPath;

@end

@implementation VedioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addRight];
    
    if (self.sourceFrom == 0) {
        [self requestLOLVideo];
    }else if(self.sourceFrom == 1){
        [self requestDotaVideo];
    }
    
    self.layoutTitle = 0;
    
    self.videoArray = [NSMutableArray array];
//    self.videoLoLarray = [NSMutableArray array];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
//    layout.itemSize = CGSizeMake(WindownWidth / 2.0, 200);
    
    
    self.showCollectionView.collectionViewLayout = layout;
    
    
    [self.showCollectionView registerNib:[UINib nibWithNibName:@"AudioCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:AudioCollectionViewCell_Identify];
    
    // Do any additional setup after loading the view.
}

-(void)requestLOLVideo{
    __weak typeof(self) weakSelf = self;
    
    [[VideoRequest shareVideoRequest] requestLOLSingleHosterAllVideoWithID:self.ID success:^(NSDictionary *dic) {
        NSLog(@"%@",dic);
        weakSelf.videoArray = [VideoModel parseVideoWithDic:dic];
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.showCollectionView reloadData];
        });
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
}
-(void)requestDotaVideo{
    __weak typeof(self) weakSelf = self;
    
    [[VideoRequest shareVideoRequest]requestDotaSingleHosterAllVideoWithID:self.ID success:^(NSDictionary *dic) {
        weakSelf.videoArray = [VideoModel parseVideoWithDic:dic];
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.showCollectionView reloadData];
        });
        NSLog(@"%@",dic);
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
        
    }];
    
}
-(void)addRight{
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:(UIBarButtonSystemItemAction) target:self action:@selector(changeLayoutType:)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
}
-(void)changeLayoutType:(UIBarButtonItem *)item{
    if (self.layoutTitle == 0) {
        self.layoutTitle = 1;
    }else if(self.layoutTitle == 1){
        self.layoutTitle = 0;
    }else{
        
    }
    [self.showCollectionView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.videoArray.count;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.layoutTitle == 0) {
        return CGSizeMake(WindownWidth , 200);
    }else if (self.layoutTitle == 1){
        return CGSizeMake(WindownWidth / 2.0, 200);
        
    }else{
        return CGSizeMake(WindownWidth, 200);
    }
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    AudioCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:AudioCollectionViewCell_Identify forIndexPath:indexPath];
    
    cell.type = (int)self.layoutTitle;
    cell.delegate = self;
    
    
    VideoModel *model = nil;
    
    model = self.videoArray[indexPath.row];
    
    cell.videoModel = model;
    
    return cell;
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    先把cell的坐标转化成屏幕坐标
    
    CGRect changedFrame = [self.currentCell convertRect:self.currentCell.frame toView:self.view];
    NSLog(@"%@",NSStringFromCGRect(changedFrame));
    if (changedFrame.origin.y <= -changedFrame.size.height || changedFrame.origin.y >= WindowHeight) {
        [self putToRightcorner];
    }else {
        [self backToCell];
    }
    
}
//当播放的cell划出屏幕,放到右下角播放
-(void)putToRightcorner{
    
    if (self.isPlaying) {
        [self.playView removeFromSuperview];
        [self.view addSubview:self.playView];
        [self.view bringSubviewToFront:self.playView];
        CGRect rightFrame = CGRectMake(WindownWidth / 2.0, WindowHeight * 2.6/4.0, WindownWidth / 2.0, WindowHeight / 4.5);
        //    添加动画
        [UIView animateWithDuration:0.5 animations:^{
            self.playView.frame = rightFrame;
            self.playView.playerLayer.frame = self.playView.bounds;
            
        }];
    }
    
}
//当播放的cell滑回屏幕是,回到原来的cell上
-(void)backToCell{
    if (self.isPlaying) {
        [self.playView removeFromSuperview];
        //    先获取屏幕上的所有cell
        NSArray *visibleCells = [self.showCollectionView  indexPathsForVisibleItems];
//        NSIndexPath *path = [self.currentCell ]
        if ([visibleCells containsObject:self.currentPath]) {
            [self.currentCell bringSubviewToFront:self.playView];
            [self.currentCell addSubview:self.playView];
            [UIView animateWithDuration:0.5 animations:^{
                //        然后把PlayerView增加到这个cell上
                self.playView.frame = self.currentCell.bounds;
                self.playView.playerLayer.frame = self.playView.bounds;
                
            }];

        }
    }
    
}
-(void)vedioCollectionViewPlayBtnClicked:(AudioCollectionViewCell *)cell{
    
//    获得cell所在行
    self.currentPath = [self.showCollectionView indexPathForCell:cell];
    
    
//    点击的cell设置为当前cell
    self.currentCell = cell;
    if (self.playView && self.isPlaying){
        [self.playView.player pause];
        [self.playView removeFromSuperview];
        self.isPlaying = NO;
    }
    VideoModel *model = cell.videoModel;
    if (_sourceFrom == 1) {
        [[VedioDetailRequest shareVideoRequest]requestDotaAuthorSimpleVideoWithID:model.authorID success:^(NSDictionary *dic) {
            NSLog(@"%@",dic);
            VedioDetailModel *model = [[VedioDetailModel alloc]init];
            [model setValuesForKeysWithDictionary:dic];
//            播放视频
            _playView = [[PlayerView alloc]initWithUrl:model.url frame:cell.bounds];
            [cell.contentView addSubview:_playView];
            cell.backgroundImageview.hidden =YES;
            self.isPlaying = YES;
            
        } failure:^(NSError *error) {
            NSLog(@"%@",error);
        }];
        }else if(_sourceFrom == 0){
            [[VedioDetailRequest shareVideoRequest]requestLOLAuthorSimpleVideoWithID:model.authorID success:^(NSDictionary *dic) {
                VedioDetailModel *model = [[VedioDetailModel alloc]init];
                [model setValuesForKeysWithDictionary:dic];
                _playView = [[PlayerView alloc]initWithUrl:model.url frame:cell.bounds];
                [cell.contentView addSubview:_playView];
            } failure:^(NSError *error) {
                NSLog(@"%@",error);
            }];
        }
        
        
        
        
        /*
        //根据Model的ID请求视频url
        if (_sourceFrom == 0) {
            [[NetworkRequest defaultNewWorkRequest] requestWithUrl:
             DotaAuthorSimpleVideoRequest_url(model.authorID) parameters:nil successResponse:^(NSDictionary *dic) {
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    _playView = [[PlayerView alloc]initWithUrl:dic[@"url"] frame:self.view.bounds];
                    [self.view addSubview:_playView];
                    
                });
                
            } failureResponse:^(NSError *error) {
                
                
            }];
        }else if (_sourceFrom == 1){
            [[NetworkRequest defaultNewWorkRequest] requestWithUrl:LOLAuthorSimpleRequest_url(model.authorID) parameters:nil successResponse:^(NSDictionary *dic) {
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    _playView = [[PlayerView alloc]initWithUrl:dic[@"url"] frame:self.view.bounds];
                    [self.view addSubview:_playView];
                });
                
            } failureResponse:^(NSError *error) {
                
                
            }];
        }
        //请求url之后，初始化playView
        
        //把playView加到cell上
        
        //播放
        */
    
    //    根据model的id去请求url...请求完url之后,初始化playerView;
    
    //    playerView增加到cell上
    //    播放
    
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
