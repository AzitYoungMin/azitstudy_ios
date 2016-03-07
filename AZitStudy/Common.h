//
//  Common.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 1. 9..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#ifndef Common_h
#define Common_h

typedef NS_ENUM(NSInteger,MemberType){
    MemberType_Student = 2,
    MemberType_Teacher,
    MemberType_Mentor,
};

typedef NS_ENUM(NSInteger,LeftMenuType){
    LeftMenuType_Home,
    LeftMenuType_AnalyzeStudy,
    LeftMenuType_AnalyzeScore,
    LeftMenuType_MeetMentor,
    LeftMenuType_Solve,
    LeftMenuType_Report,
    LeftMenuType_Question,
    LeftMenuType_Invite,
    LeftMenuType_Settings,
    LeftMenuType_MentoringReply,
    LeftMenuType_Point,
    LeftMenuType_EditProfile,
};

typedef NS_ENUM(NSInteger,SettingMenuType){
    SettingMenuType_PushAlarm,
    SettingMenuType_UserId,
    SettingMenuType_UserName,
    SettingMenuType_ClassYear,
    SettingMenuType_ChangePassword,
    SettingMenuType_EditPhoneNumber,
    SettingMenuType_Notice,
    SettingMenuType_Version,
    SettingMenuType_Terms,
    SettingMenuType_ContentsTip,
    SettingMenuType_Question,
    SettingMenuType_Logout,
    SettingMenuType_ExitService,
    SettingMenuType_StudentInvite,
    SettingMenuType_MentorInvite,
    SettingMenuType_TeacherInvite,
    SettingMenuType_LastSchool,
    SettingMenuType_CurrentSchool,
    SettingMenuType_StudentGrade,
    SettingMenuType_PurchaseDate,
    SettingMenuType_Money,
    SettingMenuType_ReportCount,
    SettingMenuType_Refund,
};

#define BOOLToString(flag)  ( flag ? @"true" : @"false" )
#define StringToBOOL(str)   ( [[str lowercaseString] isEqualToString:@"true"] )

#endif /* Common_h */
