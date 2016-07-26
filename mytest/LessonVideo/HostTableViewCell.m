//
//  HostTableViewCell.m
//  LessonVideo
//
//  Created by ss on 16/7/7.
//  Copyright © 2016年 ss. All rights reserved.
//

#import "HostTableViewCell.h"

@implementation HostTableViewCell
- (void)setHosterModel:(HosterModel *)hosterModel{
    _hosterModel = hosterModel;
    [self.avatarImageView setImageWithURL:[NSURL URLWithString:hosterModel.icon]];
    self.nameLabel.text = hosterModel.name;
    self.timeLabel.text = hosterModel.detail;
    self.rangeLabel.text = [NSString stringWithFormat:@"排名:%@",hosterModel.pop];
    
}
- (void)awakeFromNib {
    self.avatarImageView.layer.masksToBounds = YES;
    self.avatarImageView.layer.cornerRadius = self.avatarImageView.bounds.size.width / 2.0;
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
