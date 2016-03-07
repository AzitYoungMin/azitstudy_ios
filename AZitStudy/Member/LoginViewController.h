//
//  LoginViewController.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 2..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "InputBaseViewController.h"

@interface LoginViewController : InputBaseViewController<UITextFieldDelegate>{
    
    IBOutlet UIView *_emailBaseView;
    IBOutlet UIView *_passwordBaseView;
    IBOutlet UITextField *_emailTextField;
    IBOutlet UITextField *_passwordTextField;
    IBOutlet UIButton *_autoLoginCheckButton;
    IBOutlet UIButton *_findPasswordButton;
    IBOutlet UIButton *_registerButton;
}

@end
