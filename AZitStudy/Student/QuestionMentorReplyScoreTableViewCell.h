//
//  QuestionMentorReplyScoreTableViewCell.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 26..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SolveAnswerInfo;
@interface QuestionMentorReplyScoreTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *scoreButtons;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *actionButtons;

@property (strong, nonatomic) SolveAnswerInfo *answerInfo;

@end
