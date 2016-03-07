//
//  PopupSingleSelectViewController.h
//  YPER
//
//  Created by coanyaa on 2015. 12. 7..
//  Copyright © 2015년 joy2x. All rights reserved.
//

#import "PopupBaseViewController.h"

@interface PopupSingleSelectViewController : PopupBaseViewController<UITableViewDataSource, UITableViewDelegate>{
    
    IBOutlet UITableView *_tableView;
    IBOutlet NSLayoutConstraint *_tableViewHeightLayout;
}

@property (strong, nonatomic) NSArray *itemArray;
@property (assign, nonatomic) BOOL sizeToFit;

@end
