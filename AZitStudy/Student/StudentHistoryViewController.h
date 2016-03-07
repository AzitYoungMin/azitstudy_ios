//
//  StudentHistoryViewController.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 28..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "BaseViewController.h"

@class StudentInfo;
@interface StudentHistoryViewController : BaseViewController{
    
    IBOutlet UIImageView *_profileImageView;
    IBOutlet UILabel *_nameLabel;
    IBOutlet UILabel *_typeLabel;
    IBOutlet UILabel *_weekdayLabel;
    IBOutlet UILabel *_examLabel;
}


@property (strong, nonatomic) StudentInfo *studentInfo;
@end
