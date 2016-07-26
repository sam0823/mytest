//
//  AudioCollectionViewCell.h
//  LessonVideo
//
//  Created by ss on 16/7/8.
//  Copyright © 2016年 ss. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "VideoModel.h"

#define AudioCollectionViewCell_Identify @"AudioCollectionViewCell_Identify"

@class AudioCollectionViewCell;

@protocol VedioCollectionViewCellDelegate <NSObject>

-(void)vedioCollectionViewPlayBtnClicked:(AudioCollectionViewCell *)cell;

@end

@interface AudioCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageview;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *sendButton;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (nonatomic,assign) int type;

@property(assign, nonatomic)id<VedioCollectionViewCellDelegate>delegate;

@property(nonatomic,strong)VideoModel *videoModel;

- (void)setVideoModel:(VideoModel *)videoModel;


@end
