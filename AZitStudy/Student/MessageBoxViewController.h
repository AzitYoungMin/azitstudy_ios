//
//  MessageBoxViewController.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 24..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "BaseViewController.h"

@interface MessageBoxViewController : BaseViewController<UITableViewDataSource, UITableViewDelegate>{
    
    IBOutlet UITableView *_tableView;
}

@end
