//
//  DDayListTableViewCell.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 3. 4..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DDayListTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *dateTimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *remainDayLabel;
@property (strong, nonatomic) IBOutlet UIButton *checkButton;
@end
