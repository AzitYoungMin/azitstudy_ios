//
//  QuestionReplyCommentTableViewCell.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 26..
//  Copyright © 2016년 Joy2x. All rights reserved.
//
#import <UIColor+Hex.h>
#import "QuestionReplyCommentTableViewCell.h"
#import "ReplyCommentInfo.h"
#import "DateHelper.h"
#import "UIImageView+ImageCache.h"
#import "HTTPAPICommunicator.h"

@implementation QuestionReplyCommentTableViewCell

- (void)awakeFromNib {
    // Initialization code
    _actionButton.layer.cornerRadius = _actionButton.frame.size.height * 0.5;
    _actionButton.layer.masksToBounds = YES;
    _profileImageView.layer.cornerRadius = _profileImageView.frame.size.height * 0.5;
    _profileImageView.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setReplyInfo:(ReplyCommentInfo *)replyInfo
{
    _replyInfo = replyInfo;
    _nameLabel.text = replyInfo.writerName;
    _typeLabel.text = replyInfo.writerRole;
    _likeCountLabel.text = [NSString stringWithFormat:@"%@개",[replyInfo.likeCount stringValue]];
    _commentLabel.text = replyInfo.article;
    _dateTimeLabel.text = [DateHelper dateStringFromDate:replyInfo.createDate withFormat:@"yyyy-MM-dd HH:mm"];
    _profileImageView.image = [UIImage imageNamed:@"icon_profile_reply"];
    if( [replyInfo.profileImage length] > 0 ){
        NSURL *imageUrl = [[HTTPAPICommunicator sharedInstance] remoteImageURLWithPath:replyInfo.profileImage];
        [_profileImageView setCachedImageFromURL:imageUrl placeholderImage:[UIImage imageNamed:@"icon_profile_reply"]];
    }
    _likeButton.selected = replyInfo.isSelectLike;
    _likeCountLabel.textColor = ( replyInfo.isSelectLike ? [UIColor colorWithHex:0x0080FF] : [UIColor darkGrayColor]);
    
}

@end
