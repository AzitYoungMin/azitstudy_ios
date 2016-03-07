//
//  DDayListViewController.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 3. 4..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "BaseViewController.h"

@interface DDayListViewController : BaseViewController<UITableViewDataSource, UITableViewDelegate>{
    
    IBOutlet UITableView *_tableView;
}

@end
