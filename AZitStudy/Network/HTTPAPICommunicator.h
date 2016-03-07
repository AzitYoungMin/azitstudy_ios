//
//  HTTPAPICommunicator.h
//
//  Created by coanyaa
//  Copyright (c) 2015년 Joy2x. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import <CoreLocation/CoreLocation.h>
#import "Common.h"
#import "ResultInfo.h"

#define DEFAULT_TESTURL                     @"http://ec2-52-192-0-99.ap-northeast-1.compute.amazonaws.com"
#define DEFAULT_REALURL                     @"http://ec2-52-192-0-99.ap-northeast-1.compute.amazonaws.com"
#define IMAGESERVER_PORT                    @"5000"
#define API_KEY                             @"sQzVKrZqrVYOt/KaAlsw5Adu2es"

#define API_ROOT                            @"/api"
#define API_LOGIN                           API_ROOT @"/login"
#define API_CHECKDUPEMAIL                   API_ROOT @"/email/check"
#define API_CHECKDUPNICKNAME                API_ROOT @"/nickname/check"
#define API_MESSAGESEND                     API_ROOT @"/message/send"
#define API_MESSAGEDELETE                   API_ROOT @"/message/delete"
#define API_MESSAGELIST                     API_ROOT @"/message/list"
#define API_PASSWORD                        API_ROOT @"/password"
#define API_FINDPASSWORD                    API_PASSWORD @"/find"
#define API_MYSTUDYANALYSIS                 API_ROOT @"/analysis/study"
#define API_MYSTUDYANALYSISALL              API_MYSTUDYANALYSIS @"/all"
#define API_MYSTUDYANALYSISSUBJECT          API_MYSTUDYANALYSIS @"/subject"
#define API_ANALYSISGRADE                   API_ROOT @"/analysis/grade"
#define API_DOCUMENT                        API_ROOT @"/posting"
#define API_DOCUMENTLIST                    API_DOCUMENT @"/list"
#define API_DOCUMENTDETAIL                  API_DOCUMENT @"/contents"
#define API_DOCUMENTREPLY                   API_DOCUMENT @"/reply"
#define API_DOCUMENTREPLYSAVE               API_DOCMENTREPLY @"/save"
#define API_DOCUMENTREPLYLIKE               API_DOCMENTREPLY @"/like"
#define API_DOCUMENTREPLYREPORT             API_DOCMENTREPLY @"/report"
#define API_DOCUMENTREPLYDELETE             API_DOCMENTREPLY @"/delete"

// mentor
#define API_MENTOR                          API_ROOT @"/mentor"
#define API_MENTORSIGNUP                    API_MENTOR @"/signup"
#define API_MENTORPROFILE                   API_MENTOR @"/profile"
#define API_MENTORPROFILEMODIFY             API_MENTORPROFILE @"/edit"
#define API_MENTORAUTH                      API_MENTOR @"/authentication"
#define API_MENTORHOMEINFO                  API_MENTOR @"/info"
#define API_MENTORSTUDENT                   API_MENTOR @"/student"
#define API_MENTORSTUDENTLIST               API_MENTORSTUDENT @"/list"
#define API_MENTORDOCUMENT                  API_MENTOR @"/posting"
#define API_MENTORDOCUMENTLIST              API_MENTORDOCUMENT @"/list"
#define API_MENTORDOCUMENTREPLY             API_MENTORDOCUMENT @"/answer"
#define API_MENTORDOCUMENTREPLYIMAGE        API_MENTORDOCUMENTREPLY @"/image"
#define API_MENTORMANAGEMENTEE              API_MENTOR @"/premium"

// teacher
#define API_TEACHER                         API_ROOT @"/teacher"
#define API_TEACHERSIGNUP                   API_TEACHER @"/signup"
#define API_TEACHERPROFILE                  API_TEACHER @"/profile"
#define API_TEACHERPROFILEMODIFY            API_TEACHERPROFILE @"/edit"
#define API_TEACHERSTUDENT                  API_TEACHER @"/student"
#define API_TEACHERSTUDENTSEARCH            API_TEACHERSTUDENT @"/search"
#define API_TEACHERSTUDENTADD               API_TEACHERSTUDENT @"/add"
#define API_TEACHERSTUDENTLIST              API_TEACHERSTUDENT @"/list"

// student
#define API_STUDENT                         API_ROOT @"/student"
#define API_STUDENTSIGNUP                   API_STUDENT @"/signup"
#define API_STUDENTPROFILE                  API_STUDENT @"/profile"
#define API_STUDENTPROFILEMODIFY            API_STUDENTPROFILE @"/edit"
#define API_STUDENTDDAY                     API_STUDENT @"/d-day"
#define API_STUDENTDDAYLIST                 API_STUDENTDDAY @"/list"
#define API_STUDENTDDAYSAVE                 API_STUDENTDDAY @"/save"
#define API_STUDENTDDAYMODIFY               API_STUDENTDDAY @"/edit"
#define API_STUDENTDDAYDELETE               API_STUDENTDDAY @"/delete"
#define API_STUDENTDDAYCHOICE               API_STUDENTDDAY @"/choice"
#define API_STUDENTACTIVITY                 API_STUDENT @"/activity"
#define API_STUDENTACTIVITYLIST             API_STUDENTACTIVITY @"/list"
#define API_STUDENTACTIVITYADD              API_STUDENTACTIVITY @"/add"
#define API_STUDENTACTIVITYSAVE             API_STUDENTACTIVITY @"/time/save"
#define API_STUDENTACTIVITYDELETE           API_STUDENTACTIVITY @"/delete"
#define API_STUDENTDOCUMENT                 API_STUDENT @"/posting"
#define API_STUDENTDOCUMENTLIST             API_STUDENTDOCUMENT @"/list"
#define API_STUDENTDOCUMENTMENTORING        API_STUDENTDOCUMENT @"/metoring"
#define API_STUDENTDOCUMENTMENTORINGSAVE    API_STUDENTDOCUMENTMENTORING @"/save"
#define API_STUDENTDOCUMENTCLINIC           API_STUDENTDOCUMENT @"/clinic"
#define API_STUDENTDOCUMENTCLINICSAVE       API_STUDENTDOCUMENTCLINIC @"/save"
#define API_STUDENTDOCUMENTCLINICCHOICE     API_STUDENTDOCUMENTCLINIC @"/choice"
#define API_STUDENTDOCUMENTCLINICEVALUATE   API_STUDENTDOCUMENTCLINIC @"/evaluation"
#define API_STUDENTPHONE                    API_STUDENT @"/phone"
#define API_STUDENTPHONEMODIFY              API_STUDENTPHONE @"/edit"
#define API_STUDENTPASSWORDEDIT             API_STUDENT @"/password/edit"
#define API_STUDENTUNIVERSITYSAVE           API_STUDENT @"/university/save"

#define API_STUDENTAZIT                     API_STUDENT @"/azit"
#define API_STUDENTAZITINFO                 API_STUDENTAZIT @"/info"
#define API_STUDENTAZITINFOSAVE             API_STUDENTAZITINFO @"/save"
#define API_STUDENTAZITSTUDENT              API_STUDENTAZIT @"/student"
#define API_STUDENTAZITSTUDENTINFO          API_STUDENTAZITSTUDENT @"/info"
#define API_STUDENTAZITSTUDENTBADGE         API_STUDENTAZITSTUDENT @"/badge"
#define API_STUDENTMENTORING                API_STUDENT @"/premium"
#define API_STUDENTMENTORINGLIST            API_STUDENTMENTORING @"/list"
#define API_STUDENTMENTORINGQUESTION        API_STUDENTMENTORING @"/query"
#define API_STUDENTMENTORINGREPLYLIST       API_STUDENTMENTORING @"/answer/list"

#define PARAM_EMAIL                         @"email"
#define PARAM_PASSWORD                      @"password"
#define PARAM_TOKEN                         @"token"
#define PARAM_NICKNAME                      @"nickname"
#define PARAM_SECRET                        @"secret"
#define PARAM_USERID                        @"user_id"
#define PARAM_NAME                          @"name"
#define PARAM_GENDER                        @"gender"
#define PARAM_PHONE                         @"phone"
#define PARAM_EDUINSTID                     @"edu_inst_id"
#define PARAM_YEAR                          @"year"
#define PARAM_DEPARTMENT                    @"department"
#define PARAM_MATHTYPE                      @"math_type"
#define PARAM_FOREIGNLANGUAGE               @"foreign_language"
#define PARAM_OPTIONALSUBJECT               @"optional_subjects"
#define PARAM_TARGETDEPARTMENTS             @"target_departments"
#define PARAM_PARENTNAME                    @"parent_name"
#define PARAM_PARENTPHONE                   @"parent_phone"
#define PARAM_MPEDUCATION                   @"mp_education"
#define PARAM_CLASSIFICATION                @"classification"
#define PARAM_BIRTHDAY                      @"birthday"
#define PARAM_LASTSCHOOL                    @"last_school"
#define PARAM_ISGRADUATED                   @"is_graduated"
#define PARAM_DATE                          @"date"
#define PARAM_TITLE                         @"title"
#define PARAM_DDAYID                        @"dday_id"
#define PARAM_ACTIVITYID                    @"activity_id"
#define PARAM_STARTTIME                     @"start_time"
#define PARAM_ENDTIME                       @"end_time"
#define PARAM_DURATION                      @"duration"

typedef void (^HTTPAPIClientFailureBlock)(NSError* error, NSHTTPURLResponse *response);
typedef void (^HTTPAPIClientSuccessBlock)(ResultInfo *response, id responseObject);
typedef void (^HTTPDownloadProgressBlock)(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead);


@class RegisterMemberMentor;
@class RegisterMemberStudent;
@class RegisterMemberTeacher;
@class ActivityInfo;
@interface HTTPAPICommunicator : NSObject{
}

@property (assign, nonatomic) BOOL isShowProgress;
@property (strong, nonatomic) NSString *progressMessage;
@property (strong, nonatomic) NSString *rootAddress;
@property (strong, nonatomic) NSString *accessToken;
@property (strong, nonatomic) NSNumber *authorizationKey;

+ (instancetype)sharedInstance;

- (void)changeTestServer;
- (void)changeRealServer;
- (BOOL)isTestServerAddress;
- (BOOL)isRealServerAddress;
- (NSURL*)remoteImageURLWithPath:(NSString*)imagePath;
- (NSString*)contentsAddressWithFilepath:(NSString*)filePath;

// member
- (AFHTTPRequestOperation*)findPasswordForEmail:(NSString*)email success:(HTTPAPIClientSuccessBlock)success failure:(HTTPAPIClientFailureBlock)failure;
- (AFHTTPRequestOperation*)registerMentor:(RegisterMemberMentor*)member image:(UIImage*)image success:(HTTPAPIClientSuccessBlock)success failure:(HTTPAPIClientFailureBlock)failure;
- (AFHTTPRequestOperation*)registerStudent:(RegisterMemberStudent*)member success:(HTTPAPIClientSuccessBlock)success failure:(HTTPAPIClientFailureBlock)failure;
- (AFHTTPRequestOperation*)registerTeacher:(RegisterMemberTeacher*)member success:(HTTPAPIClientSuccessBlock)success failure:(HTTPAPIClientFailureBlock)failure;
- (AFHTTPRequestOperation*)loginUserWithEmail:(NSString*)email password:(NSString*)password pushToken:(NSString*)pushToken success:(HTTPAPIClientSuccessBlock)success failure:(HTTPAPIClientFailureBlock)failure;
- (AFHTTPRequestOperation*)checkEmail:(NSString*)email success:(HTTPAPIClientSuccessBlock)success failure:(HTTPAPIClientFailureBlock)failure;
- (AFHTTPRequestOperation*)profileInfoWithUserId:(NSString*)userId memberType:(MemberType)memberType success:(HTTPAPIClientSuccessBlock)success failure:(HTTPAPIClientFailureBlock)failure;

// D-day
- (AFHTTPRequestOperation*)ddayListForUserId:(NSString*)userId success:(HTTPAPIClientSuccessBlock)success failure:(HTTPAPIClientFailureBlock)failure;
- (AFHTTPRequestOperation*)addDDayForUser:(NSString*)userId title:(NSString*)title date:(NSDate*)date success:(HTTPAPIClientSuccessBlock)success failure:(HTTPAPIClientFailureBlock)failure;
- (AFHTTPRequestOperation*)editDDayForUser:(NSString*)userId ddayId:(NSNumber*)ddayId title:(NSString*)title date:(NSDate*)date success:(HTTPAPIClientSuccessBlock)success failure:(HTTPAPIClientFailureBlock)failure;
- (AFHTTPRequestOperation*)deleteDDayForUser:(NSString*)userId ddayId:(NSNumber*)ddayId success:(HTTPAPIClientSuccessBlock)success failure:(HTTPAPIClientFailureBlock)failure;
- (AFHTTPRequestOperation*)choiceDDayForUser:(NSString*)userId ddayId:(NSNumber*)ddayId success:(HTTPAPIClientSuccessBlock)success failure:(HTTPAPIClientFailureBlock)failure;
- (AFHTTPRequestOperation*)ddayInfoForUser:(NSString*)userId success:(HTTPAPIClientSuccessBlock)success failure:(HTTPAPIClientFailureBlock)failure;

// activity
- (AFHTTPRequestOperation*)activityListForUser:(NSString*)userId date:(NSDate*)date success:(HTTPAPIClientSuccessBlock)success failure:(HTTPAPIClientFailureBlock)failure;
- (AFHTTPRequestOperation*)addActivityForUser:(NSString*)userId activity:(ActivityInfo*)activity success:(HTTPAPIClientSuccessBlock)success failure:(HTTPAPIClientFailureBlock)failure;
- (AFHTTPRequestOperation*)activityTimeSaveForUser:(NSString*)userId activityId:(NSNumber*)activityId startTime:(NSTimeInterval)startTime endTime:(NSTimeInterval)endTime duration:(NSTimeInterval)duration classification:(NSString*)classification success:(HTTPAPIClientSuccessBlock)success failure:(HTTPAPIClientFailureBlock)failure;
- (AFHTTPRequestOperation*)deleteActivityForUser:(NSString*)userId activityId:(NSNumber*)activityId classification:(NSString*)classification success:(HTTPAPIClientSuccessBlock)success failure:(HTTPAPIClientFailureBlock)failure;

// download
- (AFHTTPRequestOperation*)downloadFileFromURL:(NSString*)fileUrl downPath:(NSString*)downPath parameters:(NSDictionary*)parameters progress:(HTTPDownloadProgressBlock)progress success:(HTTPAPIClientSuccessBlock)success failure:(HTTPAPIClientFailureBlock)failure;

@end
