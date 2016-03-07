//
//  QuestionMentorReplyScoreTableViewCell.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 26..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "QuestionMentorReplyScoreTableViewCell.h"
#import "SolveAnswerInfo.h"

@implementation QuestionMentorReplyScoreTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setAnswerInfo:(SolveAnswerInfo *)answerInfo
{
    _answerInfo = answerInfo;
    if( answerInfo.score ){
        NSInteger score = [answerInfo.score integerValue];
        if( score >= 0 && score < [_scoreButtons count] ){
            for(UIButton *btn in _scoreButtons )
                btn.selected = NO;
            UIButton *button = [_scoreButtons objectAtIndex:score];
            button.selected = YES;
        }
    }
}

@end
