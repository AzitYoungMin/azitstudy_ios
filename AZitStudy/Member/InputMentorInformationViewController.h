//
//  InputMentorInformationViewController.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 2..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "InputBaseViewController.h"

@class RegisterMemberMentor;
@interface InputMentorInformationViewController : InputBaseViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIActionSheetDelegate>{
    
    IBOutletCollection(UIButton) NSArray *_genderButtons;
    IBOutlet UITextField *_nameTextField;
    IBOutlet UITextField *_nicknameTextField;
    IBOutlet UITextField *_phoneNumberTextField;
    IBOutlet UITextField *_schoolTextField;
    IBOutlet UIButton *_pictureButton;
    IBOutlet UIButton *_yearButton;
}

@property (strong, nonatomic) RegisterMemberMentor *memberInfo;

@end
