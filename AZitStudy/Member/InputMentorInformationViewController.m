//
//  InputMentorInformationViewController.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 2..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "InputMentorInformationViewController.h"
#import "ProcessCertificationViewController.h"
#import "PopupSingleSelectViewController.h"
#import "RegisterMemberMentor.h"
#import "SelectItemInfo.h"

#define POPUPTAG_YEARSELECT             100

@interface InputMentorInformationViewController ()<PopupViewControllerDelegate>
@property (strong, nonatomic) UIImage *selectedImage;
@property (strong, nonatomic) NSMutableArray *selectYearArray;
@property (strong, nonatomic) SelectItemInfo *selectedInfo;

@end

@implementation InputMentorInformationViewController
- (void)updateSelectedYear:(SelectItemInfo *)info
{
    [_yearButton setTitle:info.title forState:UIControlStateNormal];
}

- (void)setupView
{
    [super setupView];
    if( self.selectedImage ){
        [_pictureButton setImage:self.selectedImage forState:UIControlStateNormal];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.selectYearArray = [NSMutableArray array];
    SelectItemInfo *info = [[SelectItemInfo alloc] initWithTitle:@"대1" selected:YES type:1];
    [_selectYearArray addObject:info];
    self.selectedInfo = info;
    info = [[SelectItemInfo alloc] initWithTitle:@"대2" selected:NO type:2];
    [_selectYearArray addObject:info];
    info = [[SelectItemInfo alloc] initWithTitle:@"대3" selected:NO type:3];
    [_selectYearArray addObject:info];
    info = [[SelectItemInfo alloc] initWithTitle:@"대4" selected:NO type:4];
    [_selectYearArray addObject:info];
    info = [[SelectItemInfo alloc] initWithTitle:@"휴학생" selected:NO type:5];
    [_selectYearArray addObject:info];
    info = [[SelectItemInfo alloc] initWithTitle:@"졸업생" selected:NO type:6];
    [_selectYearArray addObject:info];
    [self updateSelectedYear:self.selectedInfo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)showImagePickerIsCamera:(BOOL)isCamera
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.sourceType = ( isCamera ? UIImagePickerControllerSourceTypeCamera : UIImagePickerControllerSourceTypePhotoLibrary );
    imagePicker.allowsEditing = YES;
    [self presentViewController:imagePicker animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    if( image == nil )
        image = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.selectedImage = image;
    [_pictureButton setImage:image forState:UIControlStateNormal];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if( buttonIndex == actionSheet.destructiveButtonIndex ){
        self.selectedImage = nil;
        [_pictureButton setImage:[UIImage imageNamed:@"icon_join_mentor"] forState:UIControlStateNormal];
    }
    else if( buttonIndex != actionSheet.cancelButtonIndex ){
        [self showImagePickerIsCamera:( buttonIndex == actionSheet.firstOtherButtonIndex)];
    }
}

#pragma mark - PopupViewControllerDelegate
- (void)popupViewController:(PopupBaseViewController *)controller didSelectButtonIndex:(NSInteger)buttonIndex
{
    if( [controller.objectTag integerValue] == POPUPTAG_YEARSELECT && buttonIndex >= controller.firstOtherButtonIndex ){
        SelectItemInfo *info = [_selectYearArray objectAtIndex:buttonIndex-controller.firstOtherButtonIndex];
        self.selectedInfo = info;
        [self updateSelectedYear:info];
    }
    [controller hideAnimated:YES];
}

#pragma mark - action method
- (IBAction)attachImageAction:(id)sender {
    [self resignAllAction];
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"취소" destructiveButtonTitle:( self.selectedImage ? @"삭제" : nil) otherButtonTitles:@"사진찍기",@"앨범에서 가져오기", nil];
    [actionSheet showInView:self.view];
}

- (IBAction)yearSelectAction:(id)sender {
    [self resignAllAction];
    PopupSingleSelectViewController *popupVC = [AppDelegate viewControllerFromPopupWithIdentifier:@"PopupSingleSelectViewController"];
    popupVC.delegate = self;
    popupVC.itemArray = [NSArray arrayWithArray:self.selectYearArray];
    popupVC.objectTag = @(POPUPTAG_YEARSELECT);
    [popupVC showFromViewController:self animated:YES];
}

- (IBAction)genderSelectAction:(id)sender {
    [self resignAllAction];
    UIButton *button = (UIButton*)sender;
    
    for(UIButton* btn in _genderButtons)
        btn.selected = NO;
    button.selected = YES;
}

- (IBAction)doneAction:(id)sender {
    [self resignAllAction];
    
    NSString *nameStr = [_nameTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *phoneNumStr = [_phoneNumberTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *nickname = [_nicknameTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *schoolNameStr = [_schoolTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    NSInteger genderIndex = [_genderButtons indexOfObjectPassingTest:^BOOL(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *button = (UIButton*)obj;
        if( button.selected ){
            *stop = YES;
            return YES;
        }
        return NO;
    }];
    
    if( [nameStr length] < 1 ){
        [self showToastMessage:@"이름을 입력해 주세요."];
        return;
    }
    else if( [nickname length] < 1 ){
        [self showToastMessage:@"닉네임을 입력해 주세요."];
        return;
    }
    else if( [phoneNumStr length] < 1 ){
        [self showToastMessage:@"핸드폰 번호를 입력해 주세요."];
        return;
    }
    else if( genderIndex == NSNotFound ){
        [self showToastMessage:@"성별을 선택해 주세요"];
        return;
    }
    else if( self.selectedImage == nil ){
        [self showToastMessage:@"학생증 이미지를 입력해 주세요."];
        return;
    }
    
    _memberInfo.name = nameStr;
    _memberInfo.nickname = nickname;
    _memberInfo.phoneNumber = phoneNumStr;
    _memberInfo.educationPlaceId = @"1";
    _memberInfo.gender = ( genderIndex == 0 ? @"M" : @"F" );
    _memberInfo.classYear = @(_selectedInfo.type);

    [HTTPAPICommunicator sharedInstance].isShowProgress = YES;
    [HTTPAPICommunicator sharedInstance].progressMessage = @"처리중 입니다.";
    [[HTTPAPICommunicator sharedInstance] registerMentor:self.memberInfo image:self.selectedImage success:^(ResultInfo *response, id responseObject) {
        if( response.isSuccess ){
            [UIAlertView showWithTitle:nil message:@"가입되었습니다." cancelButtonTitle:@"확인" otherButtonTitles:nil tapBlock:^(UIAlertView * _Nonnull alertView, NSInteger buttonIndex) {
                [self.navigationController popToRootViewControllerAnimated:YES];
            }];
        }
        else{
            [self showToastMessage:@"회원가입에 실패했습니다."];
        }
    } failure:^(NSError *error, NSHTTPURLResponse *response) {
        
    }];
    
//    ProcessCertificationViewController *nextVC = [AppDelegate viewControllerFromMemberWithIdentifier:@"ProcessCertificationViewController"];
//    [self.navigationController pushViewController:nextVC animated:YES];
}


@end
