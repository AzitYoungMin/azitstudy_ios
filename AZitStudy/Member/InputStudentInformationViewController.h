//
//  InputStudentInformationViewController.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 2..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "InputBaseViewController.h"

@class RegisterMemberStudent;
@interface InputStudentInformationViewController : InputBaseViewController{
    
    IBOutletCollection(UIButton) NSArray *_genderButtons;
    IBOutlet UITextField *_nameTextField;
    IBOutlet UITextField *_nicknameTextField;
    IBOutlet UITextField *_phoneNumberTextField;
    IBOutlet UITextField *_schoolTextField;
    IBOutlet UIButton *_yearButton;
    IBOutlet UITextField *_parentNameTextField;
    IBOutlet UITextField *_parentPhoneTextField;
}

@property (strong, nonatomic) RegisterMemberStudent *memberInfo;

@end
