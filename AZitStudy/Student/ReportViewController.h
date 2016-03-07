//
//  ReportViewController.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 3. 3..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "BaseViewController.h"

@interface ReportViewController : BaseViewController<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>{
    
    IBOutlet UICollectionView *_collectionView;
    IBOutlet UIPageControl *_pageControl;
    IBOutlet UILabel *_titleLabel;
    IBOutlet UIButton *_nextButton;
    IBOutlet UIButton *_prevButton;
}

@end
