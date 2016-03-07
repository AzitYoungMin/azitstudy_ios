//
//  StudentHomeViewController.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 10..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "BaseViewController.h"

@interface StudentHomeViewController : BaseViewController<UITableViewDataSource, UITableViewDelegate>{
    
    IBOutlet UITableView *_tableView;
    IBOutlet UILabel *_dateLabel;
    IBOutlet UIButton *_dateNextButton;
    IBOutlet UIButton *_datePrevButton;
}

@end
