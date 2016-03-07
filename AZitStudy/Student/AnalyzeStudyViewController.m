//
//  AnalyzeStudyViewController.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 24..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "AnalyzeStudyViewController.h"
#import "AnalyzeMainViewController.h"

@interface AnalyzeStudyViewController ()
@property (strong, nonatomic) AnalyzeMainViewController *analyzeVC;
@end

@implementation AnalyzeStudyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if( [segue.identifier isEqualToString:@"analyzeMain"] ){
        self.analyzeVC = segue.destinationViewController;
        _analyzeVC.startIndex = self.startIndex;
        _analyzeVC.isShowDetailButton = YES;
    }
}


@end
