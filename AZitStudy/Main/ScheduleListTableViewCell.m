//
//  ScheduleListTableViewCell.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 23..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import <UIColor+Hex.h>
#import "ScheduleListTableViewCell.h"
#import "ActivityInfo.h"
#import "DateHelper.h"
#import "Utility.h"

@interface ScheduleListTableViewCell ()
@property (strong, nonatomic) NSTimer *runningTimer;

@end

@implementation ScheduleListTableViewCell

- (void)awakeFromNib {
    // Initialization code
    UIButton *removeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [removeButton setImage:[UIImage imageNamed:@"icon_delete"] forState:UIControlStateNormal];
    removeButton.backgroundColor = [UIColor redColor];
    UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [infoButton setImage:[UIImage imageNamed:@"icon_revise"] forState:UIControlStateNormal];
    infoButton.backgroundColor = [UIColor colorWithHex:0xFF8000];
    [self setLeftUtilityButtons:@[infoButton, removeButton] WithButtonWidth:60.0];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setActivityInfo:(ActivityInfo *)activityInfo
{
    if( _activityInfo != activityInfo ){
        [self stopRunningTimer];
    }
    _activityInfo = activityInfo;
    _iconImageView.image = [activityInfo activityIconImageWithType:activityInfo.typeId];
    _nameLabel.text = activityInfo.title;
    _memoLabel.text = activityInfo.subTitle;
    _goalLabel.text = activityInfo.goal;
    [self updateElapsedTime];
    _playButton.selected = ( activityInfo.startTime != nil );
    _stopButton.enabled = _playButton.selected;
    if( [[_playButton allTargets] count] < 1 )
        [_playButton addTarget:self action:@selector(playOrPauseAction:) forControlEvents:UIControlEventTouchUpInside];
    if( [[_stopButton allTargets] count] < 1 )
        [_stopButton addTarget:self action:@selector(stopAction:) forControlEvents:UIControlEventTouchUpInside];
        
}

- (void)updateElapsedTime
{
    if( _activityInfo.elapsedTime ){
        _elapsedTimeLabel.text = [Utility elapsedTimeStringWithTimeInterval:_activityInfo.elapsedTime];
    }
    else{
        _elapsedTimeLabel.text = [Utility elapsedTimeStringWithTimeInterval:0.0];
    }
    [self setNeedsDisplay];
}

- (void)playOrPauseAction:(UIButton*)button
{
    if( self.runningTimer == nil ){
        if( _activityInfo.startTime  == nil )
            _activityInfo.startTime = [NSDate date];
        [self startRunningTimer];
        _playButton.selected = YES;
        _stopButton.enabled = YES;
    }
    else {
        [self stopRunningTimer];
        _playButton.selected = NO;
        _stopButton.enabled = NO;
    }
}

- (void)stopAction:(UIButton*)button
{
    [self stopRunningTimer];
    _playButton.selected = NO;
    _stopButton.enabled = NO;
    _activityInfo.startTime = nil;
}

- (void)startRunningTimer
{
    if( self.runningTimer )
        [_runningTimer invalidate];
    self.runningTimer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(runningTimerActino:) userInfo:nil repeats:YES];
    if( self.activityInfo )
        _activityInfo.startTime = [NSDate date];
}

- (void)stopRunningTimer
{
    if( self.runningTimer )
        [_runningTimer invalidate];
    self.runningTimer = nil;
}

- (void)runningTimerActino:(NSTimer*)theTimer
{
    NSDate *now = [NSDate date];
    if( _activityInfo ){
        NSTimeInterval interval = [now timeIntervalSinceDate:_activityInfo.startTime];
        _activityInfo.elapsedTime += interval;
        _activityInfo.startTime = now;
        [self updateElapsedTime];
    }
}

@end
