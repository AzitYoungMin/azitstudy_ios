//
//  StudentListTableViewCell.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 24..
//  Copyright © 2016년 Joy2x. All rights reserved.
//
#import <UIColor+Hex.h>
#import "StudentListTableViewCell.h"
#import "StudentInfo.h"
#import "ExamInfo.h"
#import "UIImageView+ImageCache.h"
#import "HTTPAPICommunicator.h"

@implementation StudentListTableViewCell

- (void)awakeFromNib {
    // Initialization code
    for(UILabel* label in _weekDayLabels){
        label.layer.cornerRadius = label.frame.size.height * 0.5;
        label.layer.masksToBounds = YES;
    }
    _profileImageView.layer.cornerRadius = _profileImageView.frame.size.height * 0.5;
    _profileImageView.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setStudentInfo:(StudentInfo *)studentInfo
{
    _studentInfo = studentInfo;
    
    _checkButton.selected = studentInfo.selected;
    _nameLabel.text = studentInfo.name;
    
    BOOL hasScore = NO;
    for(ExamInfo *info in studentInfo.examArray){
        if( info.hasScore ){
            hasScore = YES;
            break;
        }
    }
    _hasScoreLabel.text = ( hasScore ? @"입력완료" : @"미입력" );
    _hasScoreBaseView.backgroundColor = ( hasScore ? [UIColor colorWithHex:0x33393d] : [UIColor colorWithHex:0xff92a2] );
    for(NSInteger i=0; i < [_weekDayLabels count]; i++){
        UILabel *weekdayLabel = [_weekDayLabels objectAtIndex:i];
        NSString *value = [studentInfo.goalAchieves objectAtIndex:i];
        if( [value integerValue] > 0 ){
            weekdayLabel.backgroundColor = [UIColor darkGrayColor];
            weekdayLabel.textColor = [UIColor whiteColor];
        }
        else{
            weekdayLabel.backgroundColor = [UIColor clearColor];
            weekdayLabel.textColor = [UIColor darkGrayColor];
        }
    }
    _profileImageView.image = [UIImage imageNamed:@"icon_profile_reply"];
    if( [studentInfo.profileImage length] > 0 ){
        NSURL *imageUrl = [[HTTPAPICommunicator sharedInstance] remoteImageURLWithPath:studentInfo.profileImage];
        [_profileImageView setCachedImageFromURL:imageUrl placeholderImage:[UIImage imageNamed:@"icon_profile_reply"]];
    }
}

@end
