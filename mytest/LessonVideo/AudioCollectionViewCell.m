//
//  AudioCollectionViewCell.m
//  LessonVideo
//
//  Created by ss on 16/7/8.
//  Copyright © 2016年 ss. All rights reserved.
//

#import "AudioCollectionViewCell.h"

@implementation AudioCollectionViewCell
-(void)setType:(int)type{
    _type = type;
    if (_type == 0) {
        _sendButton.hidden = NO;
    }else{
        _sendButton.hidden =YES;
    }
}

- (void)setVideoModel:(VideoModel *)videoModel{
    _videoModel = videoModel;
    
    [self.backgroundImageview setImageWithURL:[NSURL URLWithString:videoModel.thumb]];
    self.timeLabel.text =  [NSString stringWithFormat:@"%@",videoModel.time];;
    
    self.textLabel.text = videoModel.title;
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (IBAction)playBtnClicked:(UIButton *)sender {
    if (_delegate && [_delegate respondsToSelector:@selector(vedioCollectionViewPlayBtnClicked:)]) {
        [_delegate vedioCollectionViewPlayBtnClicked:self];
    }
}
-(void)vedioCollectionViewPlayBtnClicked:(AudioCollectionViewCell *)cell{
    
    
}
@end
