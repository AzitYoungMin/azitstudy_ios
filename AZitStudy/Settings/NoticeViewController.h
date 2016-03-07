//
//  NoticeViewController.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 25..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "BaseViewController.h"

@interface NoticeViewController : BaseViewController<UITableViewDataSource, UITableViewDelegate>{
    
    IBOutlet UITableView *_tableView;
}

@end
