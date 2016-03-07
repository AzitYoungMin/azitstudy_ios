//
//  QuestionMentorReplyTableViewCell.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 27..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SolveAnswerInfo;
@interface QuestionMentorReplyTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *profileImageView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *typeLabel;
@property (strong, nonatomic) IBOutlet UILabel *commentLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateTimeLabel;
@property (strong, nonatomic) IBOutlet UIButton *actionButton;
@property (strong, nonatomic) IBOutlet UIButton *chooseButton;

@property (strong, nonatomic) SolveAnswerInfo *answerInfo;

@end
