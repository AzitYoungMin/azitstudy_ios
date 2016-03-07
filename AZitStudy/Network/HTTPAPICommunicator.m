//
//  HTTPAPICommunicator.m
//
//  Created by coanyaa
//  Copyright (c) 2015년 Joy2x. All rights reserved.
//

#import <CocoaSecurity.h>
#import "HTTPAPICommunicator.h"
#import <MRProgress.h>
#import "AppDelegate.h"
#import "DateHelper.h"
#import "UploadFileInfo.h"
#import "Utility.h"
#import "RegisterMemberMentor.h"
#import "RegisterMemberStudent.h"
#import "RegisterMemberTeacher.h"
#import "ActivityInfo.h"

@interface HTTPAPICommunicator ()
@property (strong, nonatomic) NSMutableArray *taskArray;

@end

@implementation HTTPAPICommunicator

+ (instancetype)sharedInstance
{
    static HTTPAPICommunicator *communicator = nil;
    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken, ^{
        communicator = [[HTTPAPICommunicator alloc] init];
#ifdef DEBUG
        communicator.rootAddress = DEFAULT_TESTURL;
#else
        communicator.rootAddress = DEFAULT_REALURL;
#endif
        [communicator changeTestServer];
    });
    
    return communicator;
}

- (void)changeTestServer
{
    self.rootAddress = DEFAULT_TESTURL;
}

- (void)changeRealServer
{
    self.rootAddress = DEFAULT_REALURL;
}

- (BOOL)isTestServerAddress
{
    return [self.rootAddress isEqualToString:DEFAULT_TESTURL];
}

- (BOOL)isRealServerAddress
{
    return [self.rootAddress isEqualToString:DEFAULT_REALURL];
}

- (NSURL*)remoteImageURLWithPath:(NSString*)imagePath
{
    if( [imagePath length] < 1 )
        return nil;
    return [NSURL URLWithString:[[self.rootAddress stringByAppendingFormat:@":%@",IMAGESERVER_PORT] stringByAppendingPathComponent:imagePath]];
}

- (NSString*)contentsAddressWithFilepath:(NSString*)filePath
{
    return [self.rootAddress stringByAppendingPathComponent:filePath];
}

- (id)init
{
    self = [super init];
    if( self ){
        self.taskArray = [NSMutableArray array];
        self.isShowProgress = NO;
        self.progressMessage = nil;
    }
    
    return self;
}

- (void)addTask:(id)task
{
    if( [_taskArray indexOfObject:task] == NSNotFound )
        [self.taskArray addObject:task];
    else
        [task cancel];
}

- (void)removeTask:(id)task
{
    [_taskArray removeObject:task];
}


- (void)showProgress
{
    if( self.isShowProgress ){
        [MRProgressOverlayView showOverlayAddedTo:[AppDelegate appDelegate].window title:([self.progressMessage length] < 1 ? @"" : self.progressMessage) mode:MRProgressOverlayViewModeIndeterminateSmall animated:YES];
    }
}

- (void)hideProgress
{
    self.progressMessage = @"";
    [MRProgressOverlayView dismissAllOverlaysForView:[AppDelegate appDelegate].window animated:YES];
}


- (void)processSuccessWithTask:(id)task responseObject:(id)responseObject successBlock:(HTTPAPIClientSuccessBlock)successBlock
{
    NSURLRequest *request = ((AFHTTPRequestOperation*)task).request;
    
    [self hideProgress];
    ResultInfo *response = nil;
    if( responseObject ){
        response = [[ResultInfo alloc] initWithData:responseObject];
        NSLog(@"%@ response string : %@",[request.URL absoluteString],response.textData);
    }
    
    if( successBlock ){
        successBlock(response,responseObject);
    }
    [self removeTask:task];
}

- (void)processFailWithTask:(id)task error:(NSError*)error failBlock:(HTTPAPIClientFailureBlock)failureBlock
{
    NSURLRequest *request = ((AFHTTPRequestOperation*)task).request;
    NSHTTPURLResponse *response = ((AFHTTPRequestOperation*)task).response;
    NSLog(@"%@ %@",[request.URL absoluteString],[error localizedDescription]);
    [self hideProgress];
    if( failureBlock )
        failureBlock(error, response);
    [self removeTask:task];
}


- (AFHTTPRequestOperation*)createRequestWithURL:(NSString*)url method:(NSString*)method httpHeaderParam:(NSDictionary*)httpHeaderParam parameters:(id)parameters success:(HTTPAPIClientSuccessBlock)success failure:(HTTPAPIClientFailureBlock)failure
{
    [self showProgress];
    
    AFHTTPRequestSerializer *requestSerializer = [[AFHTTPRequestSerializer alloc] init];
    NSMutableURLRequest *request = [requestSerializer requestWithMethod:method URLString:url parameters:nil error:nil];
    for(NSString *key in [httpHeaderParam allKeys] ){
        [request setValue:[httpHeaderParam objectForKey:key] forHTTPHeaderField:key];
    }

    if( [parameters count] > 0 ){
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:nil];
        [request setHTTPBody:jsonData];
        NSLog(@"%s %@",__FUNCTION__, [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding] );
    }
    
    NSLog(@"%s %@ %@, http header: %@",__FUNCTION__,method,url,httpHeaderParam);
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [[AFHTTPResponseSerializer alloc] init];
    [operation.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"text/html",@"text/plain",@"application/json", nil]];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self processSuccessWithTask:operation responseObject:responseObject successBlock:success];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self processFailWithTask:operation error:error failBlock:failure];
    }];
    [self addTask:operation];
    
    return operation;
}

- (AFHTTPRequestOperation*)createMultipartFormDataRequestWithURL:(NSString*)url method:(NSString*)method httpHeaderParam:(NSDictionary*)httpHeaderParam parameters:(NSDictionary*)parameters files:(NSArray*)fileArray success:(HTTPAPIClientSuccessBlock)success failure:(HTTPAPIClientFailureBlock)failure
{
    [self showProgress];
    
    AFHTTPRequestSerializer *requestSerializer = [[AFHTTPRequestSerializer alloc] init];
    
    
    NSMutableURLRequest *request = [requestSerializer multipartFormRequestWithMethod:method URLString:url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        for(UploadFileInfo *fileInfo in fileArray){
            [formData appendPartWithFileData:fileInfo.fileData name:fileInfo.key fileName:fileInfo.fileName mimeType:fileInfo.mimeType];
        }
        if( [parameters count] > 0 ){
            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:nil];
            [formData appendPartWithFormData:jsonData name:@"jsonbody"];
        }
    } error:nil];
    
    for(NSString *key in [httpHeaderParam allKeys] ){
        [request setValue:[httpHeaderParam objectForKey:key] forHTTPHeaderField:key];
    }

//    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

    

    NSLog(@"%s %@ %@, http header: %@, parameters: %@",__FUNCTION__,method,url,httpHeaderParam,parameters);
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [[AFHTTPResponseSerializer alloc] init];
    [operation.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"text/html",@"text/plain",@"application/json", nil]];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self processSuccessWithTask:operation responseObject:responseObject successBlock:success];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self processFailWithTask:operation error:error failBlock:failure];
    }];
    [self addTask:operation];
    
    return operation;
}


#pragma mark - addres control
- (NSString*)getAddressWithAPI:(NSString*)api
{
    return [[self.rootAddress stringByAppendingString:api] stringByAppendingFormat:@"?key=%@",API_KEY];
}

- (NSMutableDictionary *)authorizedParametersWithParameters:(NSDictionary*)params
{
    NSMutableDictionary *dict = nil;
    if( params )
        dict = [NSMutableDictionary dictionaryWithDictionary:params];
    else
        dict = [NSMutableDictionary dictionary];
    
    if( [self.accessToken length] > 0 ){
        [dict setObject:self.accessToken forKey:PARAM_SECRET];
    }
    return dict;
}

#pragma mark - member
- (AFHTTPRequestOperation*)findPasswordForEmail:(NSString*)email success:(HTTPAPIClientSuccessBlock)success failure:(HTTPAPIClientFailureBlock)failure
{
    NSString *url = [self getAddressWithAPI:API_FINDPASSWORD];
    
    AFHTTPRequestOperation *operation = [self createRequestWithURL:url method:@"POST" httpHeaderParam:nil parameters:@{PARAM_EMAIL:email} success:success failure:failure];
    [operation start];
    
    return operation;
}

- (AFHTTPRequestOperation*)registerMentor:(RegisterMemberMentor*)member image:(UIImage*)image success:(HTTPAPIClientSuccessBlock)success failure:(HTTPAPIClientFailureBlock)failure
{
    UploadFileInfo *fileInfo = nil;
    
    NSString *url = [self getAddressWithAPI:API_MENTORSIGNUP];
    
    if( image ){
        NSData *imageData = UIImageJPEGRepresentation(image, 0.8);
        fileInfo = [[UploadFileInfo alloc] initWithFileData:imageData key:@"profile_image" filename:@"profile" mimeType:@"image/jpeg"];
    }
    
    AFHTTPRequestOperation *operation = [self createMultipartFormDataRequestWithURL:url method:@"POST" httpHeaderParam:nil parameters:[member dictionaryObject] files:( fileInfo ? @[fileInfo] : nil ) success:success failure:failure];
    [operation start];
    
    return operation;
}

- (AFHTTPRequestOperation*)registerStudent:(RegisterMemberStudent*)member success:(HTTPAPIClientSuccessBlock)success failure:(HTTPAPIClientFailureBlock)failure
{
    NSString *url = [self getAddressWithAPI:API_STUDENTSIGNUP];
    
    AFHTTPRequestOperation *operation = [self createRequestWithURL:url method:@"POST" httpHeaderParam:nil parameters:[member dictionaryObject] success:success failure:failure];
    [operation start];
    
    return operation;
    
}

- (AFHTTPRequestOperation*)registerTeacher:(RegisterMemberTeacher*)member success:(HTTPAPIClientSuccessBlock)success failure:(HTTPAPIClientFailureBlock)failure
{
    NSString *url = [self getAddressWithAPI:API_TEACHERSIGNUP];
    
    AFHTTPRequestOperation *operation = [self createRequestWithURL:url method:@"POST" httpHeaderParam:nil parameters:[member dictionaryObject] success:success failure:failure];
    [operation start];
    
    return operation;
}

- (AFHTTPRequestOperation*)loginUserWithEmail:(NSString*)email password:(NSString*)password pushToken:(NSString*)pushToken success:(HTTPAPIClientSuccessBlock)success failure:(HTTPAPIClientFailureBlock)failure
{
    NSString *url = [self getAddressWithAPI:API_LOGIN];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{PARAM_EMAIL : email, PARAM_PASSWORD : password}];
    if( [pushToken length] > 0 )
        [params setObject:pushToken forKey:PARAM_TOKEN];
    
    AFHTTPRequestOperation *operation = [self createRequestWithURL:url method:@"POST" httpHeaderParam:nil parameters:params success:success failure:failure];
    [operation start];
    
    return operation;
}

- (AFHTTPRequestOperation*)checkEmail:(NSString*)email success:(HTTPAPIClientSuccessBlock)success failure:(HTTPAPIClientFailureBlock)failure
{
    NSString *url = [self getAddressWithAPI:API_CHECKDUPEMAIL];
    
    AFHTTPRequestOperation *operation = [self createRequestWithURL:url method:@"POST" httpHeaderParam:nil parameters:@{PARAM_EMAIL:email} success:success failure:failure];
    [operation start];
    
    return operation;
}

- (AFHTTPRequestOperation*)profileInfoWithUserId:(NSString*)userId memberType:(MemberType)memberType success:(HTTPAPIClientSuccessBlock)success failure:(HTTPAPIClientFailureBlock)failure
{
    NSString *url = [self getAddressWithAPI:( memberType == MemberType_Mentor ? API_MENTORPROFILE : ( memberType == MemberType_Student ? API_STUDENTPROFILE : API_TEACHERPROFILE) )];
    
    AFHTTPRequestOperation *operation = [self createRequestWithURL:url method:@"POST" httpHeaderParam:nil parameters:[self authorizedParametersWithParameters:@{PARAM_USERID:userId}] success:success failure:failure];
    [operation start];
    
    return operation;
}

#pragma mark - D-day
- (AFHTTPRequestOperation*)ddayListForUser:(NSString*)userId success:(HTTPAPIClientSuccessBlock)success failure:(HTTPAPIClientFailureBlock)failure
{
    NSString *url = [self getAddressWithAPI:API_STUDENTDDAYLIST];
    
    AFHTTPRequestOperation *operation = [self createRequestWithURL:url method:@"POST" httpHeaderParam:nil parameters:[self authorizedParametersWithParameters:@{PARAM_USERID:userId}] success:success failure:failure];
    [operation start];
    
    return operation;
}

- (AFHTTPRequestOperation*)addDDayForUser:(NSString*)userId title:(NSString*)title date:(NSDate*)date success:(HTTPAPIClientSuccessBlock)success failure:(HTTPAPIClientFailureBlock)failure
{
    NSString *url = [self getAddressWithAPI:API_STUDENTDDAYSAVE];
    
    AFHTTPRequestOperation *operation = [self createRequestWithURL:url method:@"POST" httpHeaderParam:nil parameters:[self authorizedParametersWithParameters:@{PARAM_USERID:userId, PARAM_TITLE:title, PARAM_DATE:[DateHelper dateStringFromDate:date withFormat:@"yyyy.MM.dd"]}] success:success failure:failure];
    [operation start];
    
    return operation;
}

- (AFHTTPRequestOperation*)editDDayForUser:(NSString*)userId ddayId:(NSNumber*)ddayId title:(NSString*)title date:(NSDate*)date success:(HTTPAPIClientSuccessBlock)success failure:(HTTPAPIClientFailureBlock)failure
{
    NSString *url = [self getAddressWithAPI:API_STUDENTDDAYMODIFY];
    
    AFHTTPRequestOperation *operation = [self createRequestWithURL:url method:@"POST" httpHeaderParam:nil parameters:[self authorizedParametersWithParameters:@{PARAM_USERID:userId, PARAM_DDAYID:ddayId, PARAM_TITLE:title, PARAM_DATE:[DateHelper dateStringFromDate:date withFormat:@"yyyy.MM.dd"]}] success:success failure:failure];
    [operation start];
    
    return operation;
}

- (AFHTTPRequestOperation*)deleteDDayForUser:(NSString*)userId ddayId:(NSNumber*)ddayId success:(HTTPAPIClientSuccessBlock)success failure:(HTTPAPIClientFailureBlock)failure
{
    NSString *url = [self getAddressWithAPI:API_STUDENTDDAYDELETE];
    
    AFHTTPRequestOperation *operation = [self createRequestWithURL:url method:@"POST" httpHeaderParam:nil parameters:[self authorizedParametersWithParameters:@{PARAM_USERID:userId, PARAM_DDAYID:ddayId}] success:success failure:failure];
    [operation start];
    
    return operation;
}

- (AFHTTPRequestOperation*)choiceDDayForUser:(NSString*)userId ddayId:(NSNumber*)ddayId success:(HTTPAPIClientSuccessBlock)success failure:(HTTPAPIClientFailureBlock)failure
{
    NSString *url = [self getAddressWithAPI:API_STUDENTDDAYCHOICE];
    
    AFHTTPRequestOperation *operation = [self createRequestWithURL:url method:@"POST" httpHeaderParam:nil parameters:[self authorizedParametersWithParameters:@{PARAM_USERID:userId, PARAM_DDAYID:ddayId}] success:success failure:failure];
    [operation start];
    
    return operation;
}

- (AFHTTPRequestOperation*)ddayInfoForUser:(NSString*)userId success:(HTTPAPIClientSuccessBlock)success failure:(HTTPAPIClientFailureBlock)failure
{
    NSString *url = [self getAddressWithAPI:API_STUDENTDDAY];
    
    AFHTTPRequestOperation *operation = [self createRequestWithURL:url method:@"POST" httpHeaderParam:nil parameters:[self authorizedParametersWithParameters:@{PARAM_USERID:userId}] success:success failure:failure];
    [operation start];
    
    return operation;
}

#pragma mark - activity
- (AFHTTPRequestOperation*)activityListForUserId:(NSString*)userId date:(NSDate*)date success:(HTTPAPIClientSuccessBlock)success failure:(HTTPAPIClientFailureBlock)failure
{
    NSString *url = [self getAddressWithAPI:API_STUDENTACTIVITYLIST];
    
    AFHTTPRequestOperation *operation = [self createRequestWithURL:url method:@"POST" httpHeaderParam:nil parameters:[self authorizedParametersWithParameters:@{PARAM_USERID:userId, PARAM_DATE:[DateHelper dateStringFromDate:date withFormat:@"yyyy.MM.dd"]}] success:success failure:failure];
    [operation start];
    
    return operation;
}

- (AFHTTPRequestOperation*)addActivityForUser:(NSString*)userId activity:(ActivityInfo*)activity success:(HTTPAPIClientSuccessBlock)success failure:(HTTPAPIClientFailureBlock)failure
{
    NSString *url = [self getAddressWithAPI:API_STUDENTACTIVITYADD];
    NSMutableDictionary *dict = [activity dictionaryObject];
    [dict setObject:userId forKey:PARAM_USERID];
    
    AFHTTPRequestOperation *operation = [self createRequestWithURL:url method:@"POST" httpHeaderParam:nil parameters:[self authorizedParametersWithParameters:dict] success:success failure:failure];
    [operation start];
    
    return operation;
}

- (AFHTTPRequestOperation*)activityTimeSaveForUser:(NSString*)userId activityId:(NSNumber*)activityId startTime:(NSTimeInterval)startTime endTime:(NSTimeInterval)endTime duration:(NSTimeInterval)duration classification:(NSString*)classification success:(HTTPAPIClientSuccessBlock)success failure:(HTTPAPIClientFailureBlock)failure
{
    NSString *url = [self getAddressWithAPI:API_STUDENTACTIVITYSAVE];

    
    AFHTTPRequestOperation *operation = [self createRequestWithURL:url method:@"POST" httpHeaderParam:nil parameters:[self authorizedParametersWithParameters:@{PARAM_USERID:userId, PARAM_ACTIVITYID:activityId, PARAM_STARTTIME: [Utility timeStringWithTimeInterval:startTime], PARAM_ENDTIME : [Utility timeStringWithTimeInterval:endTime], PARAM_DURATION:[Utility timeStringWithTimeInterval:duration], PARAM_CLASSIFICATION:classification}] success:success failure:failure];
    [operation start];
    
    return operation;
}

- (AFHTTPRequestOperation*)deleteActivityForUser:(NSString*)userId activityId:(NSNumber*)activityId classification:(NSString*)classification success:(HTTPAPIClientSuccessBlock)success failure:(HTTPAPIClientFailureBlock)failure
{
    NSString *url = [self getAddressWithAPI:API_STUDENTDDAYDELETE];
    
    
    AFHTTPRequestOperation *operation = [self createRequestWithURL:url method:@"POST" httpHeaderParam:nil parameters:[self authorizedParametersWithParameters:@{PARAM_USERID:userId, PARAM_ACTIVITYID:activityId, PARAM_CLASSIFICATION:classification}] success:success failure:failure];
    [operation start];
    
    return operation;

}


#pragma mark -file download
- (AFHTTPRequestOperation*)downloadFileFromURL:(NSString*)fileUrl downPath:(NSString*)downPath parameters:(NSDictionary*)parameters progress:(HTTPDownloadProgressBlock)progress success:(HTTPAPIClientSuccessBlock)success failure:(HTTPAPIClientFailureBlock)failure
{
    AFHTTPRequestOperation *operation = [self createRequestWithURL:fileUrl method:@"GET" httpHeaderParam:nil parameters:parameters success:success failure:failure];
    
    [operation setOutputStream:[NSOutputStream outputStreamToFileAtPath:downPath append:NO]];
    [operation setDownloadProgressBlock:progress];
    
    [operation start];
    
    return operation;
}

@end
