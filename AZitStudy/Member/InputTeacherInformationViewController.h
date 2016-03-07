//
//  InputTeacherInformationViewController.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 2..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "InputBaseViewController.h"

@class RegisterMemberTeacher;
@interface InputTeacherInformationViewController : InputBaseViewController{
    
    IBOutletCollection(UIButton) NSArray *_genderButtons;
    IBOutletCollection(UIButton) NSArray *_educationTypeButtons;
    IBOutlet UIButton *_birthdayButton;
    IBOutlet UITextField *_nameTextField;
    IBOutlet UITextField *_phoneNumberTextField;
    IBOutlet UITextField *_lastSchoolTextField;
    IBOutlet UITextField *_orgNameTextField;
}

@property (strong, nonatomic) RegisterMemberTeacher *memberInfo;

@end
