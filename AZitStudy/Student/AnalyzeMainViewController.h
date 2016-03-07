//
//  AnalyzeMainViewController.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 27..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "BaseViewController.h"

@interface AnalyzeMainViewController : BaseViewController{
    
    IBOutlet UISegmentedControl *_tabSegmentCtrl;
}

@property (strong, nonatomic) NSNumber *startIndex;
@property (assign, nonatomic) BOOL isShowDetailButton;

@end
