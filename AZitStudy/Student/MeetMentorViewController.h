//
//  MeetMentorViewController.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 24..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "BaseViewController.h"

@interface MeetMentorViewController : BaseViewController<UITableViewDataSource, UITableViewDelegate>{
    
    IBOutlet UITableView *_tableView;
    IBOutlet UIButton *_filterButton;
    IBOutlet UIButton *_writeButton;
}

@end
