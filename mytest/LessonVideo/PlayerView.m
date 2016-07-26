//
//  PlayerView.m
//  LessonVideo
//
//  Created by ss on 16/7/8.
//  Copyright © 2016年 ss. All rights reserved.
// 以后播放视频可以用的~

#import "PlayerView.h"

@implementation PlayerView
- (id)initWithUrl:(NSString *)url
            frame:(CGRect)frame{
    self = [super init];
    if (self) {
        self.frame = frame;
        self.backgroundColor = [UIColor clearColor];
        _playerItem = [[AVPlayerItem alloc]initWithURL:[NSURL URLWithString:url]];
        _player = [AVPlayer playerWithPlayerItem:_playerItem];
        _playerLayer = [AVPlayerLayer playerLayerWithPlayer:_player];
        [self.layer addSublayer:self.playerLayer];
        _playerLayer.frame = self.bounds;
        [_player addObserver:self forKeyPath:@"status" options:(NSKeyValueObservingOptionInitial |NSKeyValueObservingOptionNew |                                                                NSKeyValueObservingOptionOld ) context:nil];
        
    }
    return self;
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"status"]) {
//        当状态变为readytoplay的时候,播放视频
        NSLog(@"change === %@",change);
        if (_player.status == AVPlayerStatusReadyToPlay) {
            [_player play];
        }
    }
}
-(void)dealloc{
    [_player removeObserver:self forKeyPath:@"status" context:nil];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
