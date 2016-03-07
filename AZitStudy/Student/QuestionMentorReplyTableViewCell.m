//
//  QuestionMentorReplyTableViewCell.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 27..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "QuestionMentorReplyTableViewCell.h"
#import "SolveAnswerInfo.h"
#import "DateHelper.h"
#import "UIImageView+ImageCache.h"
#import "HTTPAPICommunicator.h"

@implementation QuestionMentorReplyTableViewCell

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

- (void)setAnswerInfo:(SolveAnswerInfo *)answerInfo
{
    _answerInfo = answerInfo;
    _nameLabel.text = answerInfo.writerName;
    _commentLabel.text = answerInfo.article;
    _dateTimeLabel.text = [DateHelper dateStringFromDate:answerInfo.createDate withFormat:@"yyyy-MM-dd HH:mm"];
    _chooseButton.selected = answerInfo.isChoosen;
    _profileImageView.image = [UIImage imageNamed:@"icon_profile_reply"];
    if( [answerInfo.profileImage length] > 0 ){
        NSURL *imageUrl = [[HTTPAPICommunicator sharedInstance] remoteImageURLWithPath:answerInfo.profileImage];
        [_profileImageView setCachedImageFromURL:imageUrl placeholderImage:[UIImage imageNamed:@"icon_profile_reply"]];
    }

}

@end
