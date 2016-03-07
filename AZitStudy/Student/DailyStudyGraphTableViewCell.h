//
//  DailyStudyGraphTableViewCell.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 28..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SHLineGraphView.h>
@interface DailyStudyGraphTableViewCell : UITableViewCell{
    
    IBOutletCollection(UIView) NSArray *_legendColorViews;
}

@property (strong, nonatomic) IBOutlet UIView *baseView;
@property (strong, nonatomic) IBOutlet UIView *graphBaseView;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) IBOutlet SHLineGraphView *graphView;

@end
