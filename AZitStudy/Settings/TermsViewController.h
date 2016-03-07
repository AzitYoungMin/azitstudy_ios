//
//  TermsViewController.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 25..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "BaseViewController.h"

@interface TermsViewController : BaseViewController{
    
    IBOutlet UIView *_underbarView;
    IBOutlet NSLayoutConstraint *_underbarViewLeadingLayout;
    IBOutlet NSLayoutConstraint *_underbarViewWidthLayout;
    IBOutletCollection(UIButton) NSArray *_tabButtons;
    IBOutlet UILabel *_titleLabel;
}

@end
