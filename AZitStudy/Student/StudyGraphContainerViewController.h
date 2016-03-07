//
//  StudyGraphContainerViewController.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 28..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "BaseViewController.h"

@interface StudyGraphContainerViewController : BaseViewController{
    IBOutletCollection(UIButton) NSArray *_tabButtons;
}

@property (assign, nonatomic) BOOL isShowDetailButton;

@end
