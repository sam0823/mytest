//
//  HostTableViewCell.h
//  LessonVideo
//
//  Created by ss on 16/7/7.
//  Copyright © 2016年 ss. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HosterModel.h"

@interface HostTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *rangeLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (nonatomic,strong)HosterModel *hosterModel;
- (void)setHosterModel:(HosterModel *)hosterModel;
@end
