//
//  StudentHistoryViewController.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 28..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "StudentHistoryViewController.h"
#import "AnalyzeMainViewController.h"
#import "StudentInfo.h"
#import "ExamInfo.h"

@interface StudentHistoryViewController ()
@property (strong, nonatomic) AnalyzeMainViewController *analyzeVC;

@end

@implementation StudentHistoryViewController

- (void)updateStudentInfo:(StudentInfo*)info
{
    _profileImageView.image = [UIImage imageNamed:@"icon_profile_reply"];
    if( [info.profileImage length] > 0 ){
        NSURL *imageUrl = [[HTTPAPICommunicator sharedInstance] remoteImageURLWithPath:info.profileImage];
        [_profileImageView setCachedImageFromURL:imageUrl placeholderImage:[UIImage imageNamed:@"icon_profile_reply"]];
    }
    _nameLabel.text = info.name;
    
    if( [info.examArray count] > 0 ){
        
    }
}

- (void)setupView
{
    [super setupView];
    [self updateStudentInfo:self.studentInfo];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _profileImageView.layer.cornerRadius = _profileImageView.frame.size.height * 0.5;
    _profileImageView.layer.masksToBounds = YES;
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
        _analyzeVC.startIndex = nil;
        _analyzeVC.isShowDetailButton = NO;
    }
}


@end
