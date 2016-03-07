//
//  TeacherHomeViewController.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 10..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "BaseViewController.h"

@interface TeacherHomeViewController : BaseViewController<UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>{
    
    IBOutlet UITableView *_tableView;
    IBOutlet UITextField *_messageTextField;
    IBOutlet UIButton *_examSelectButton;
}

@end
