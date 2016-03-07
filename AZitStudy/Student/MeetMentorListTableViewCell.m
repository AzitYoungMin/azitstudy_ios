//
//  MeetMentorListTableViewCell.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 26..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "MeetMentorListTableViewCell.h"
#import "SolveListInfo.h"
#import "DateHelper.h"

@implementation MeetMentorListTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setQuestionInfo:(SolveListInfo *)questionInfo
{
    _questionInfo = questionInfo;
    _titleLabel.text = questionInfo.title;
    _nameLabel.text = questionInfo.writerName;
    _dateTimeLabel.text = [DateHelper dateStringFromDate:questionInfo.createDate withFormat:@"yyyy-MM-dd HH:mm:ss"];
    _replyCountLabel.text = [NSString stringWithFormat:@"(%@)",[questionInfo.replyCount stringValue]];
}
@end
