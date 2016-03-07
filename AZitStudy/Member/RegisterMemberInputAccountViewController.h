//
//  RegisterMemberInputAccountViewController.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 2..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "InputBaseViewController.h"

@class RegisterMemberBaseInfo;
@interface RegisterMemberInputAccountViewController : InputBaseViewController<UITextFieldDelegate>{
    
    IBOutlet UIView *_teacherTypeView;
    IBOutletCollection(UIButton) NSArray *_teacherTypeButtons;
    IBOutlet NSLayoutConstraint *_teacherTypeViewHeightLayout;
    IBOutlet UITextField *_emailTextField;
    IBOutlet UITextField *_passwordTextField;
    IBOutlet UITextField *_confirmPasswordTextField;
    IBOutlet UIView *_emailUnderlineView;
    IBOutlet NSLayoutConstraint *_errorMessageHeightLayout;
    IBOutlet UIView *_errorMessageView;
}

@property (assign, nonatomic) NSInteger memberType;
@property (strong, nonatomic) RegisterMemberBaseInfo *memberInfo;

@end
