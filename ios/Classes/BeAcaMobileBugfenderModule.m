/**
 * Bugfender
 *
 * Created by Your Name
 * Copyright (c) 2019 Your Company. All rights reserved.
 */

#import "BeAcaMobileBugfenderModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import "TiApp.h"
#import <BugfenderSDK/BugfenderSDK.h>

@implementation BeAcaMobileBugfenderModule

#pragma mark Internal

// This is generated for your module, please do not change it
- (id)moduleGUID
{
  return @"5f893a6c-b98f-44dd-a9d7-892bfbabeeea";
}

// This is generated for your module, please do not change it
- (NSString *)moduleId
{
  return @"be.aca.mobile.bugfender";
}

- (void)logWithArgs:(id)args andLogLevel:(BFLogLevel) logLevel
{
    ENSURE_SINGLE_ARG(args, NSDictionary);
    NSString* tag = [args objectForKey:@"tag"];
    NSString* message = [args objectForKey:@"message"];
    
    BFLog2(logLevel, tag, @"%@", message);
}

- (void)setHintStylingWithStyling:(NSDictionary*) styling andFeedbackViewController:(BFUserFeedbackViewController*) feedbackViewController
{
    NSDictionary* mainStyling = [styling objectForKey:@"mainStyling"];
    if (mainStyling != nil) {
        NSString* mainBackgroundColor = [mainStyling objectForKey:@"mainBackgroundColor"];
        if (mainBackgroundColor != nil) {
            feedbackViewController.mainBackgroundColor = [self colorWithHexString:mainBackgroundColor];
        }
        
        NSString* secondaryBackgroundColor = [mainStyling objectForKey:@"secondaryBackgroundColor"];
        if (secondaryBackgroundColor != nil) {
            feedbackViewController.secondaryBackgroundColor = [self colorWithHexString:secondaryBackgroundColor];
        }
    }
}

- (void)setSubjectStylingWithStyling:(NSDictionary*) styling andFeedbackViewController:(BFUserFeedbackViewController*) feedbackViewController
{
    NSDictionary* subjectStyling = [styling objectForKey:@"subjectStyling"];
    if (subjectStyling != nil) {
        NSObject* subjectFontSize = [subjectStyling objectForKey:@"subjectFontSize"];
        NSString* subjectFont = [subjectStyling objectForKey:@"subjectFont"];
        if (subjectFont != nil && subjectFontSize != nil) {
            feedbackViewController.subjectFont = [UIFont fontWithName: subjectFont size: [TiUtils floatValue:subjectFontSize]];
        }
        
        NSString* subjectFontColor = [subjectStyling objectForKey:@"subjectFontColor"];
        if (subjectFontColor != nil) {
            feedbackViewController.subjectFontColor = [self colorWithHexString:subjectFontColor];
        }
        
        NSString* subjectPlaceholderFontColor = [subjectStyling objectForKey:@"subjectPlaceholderFontColor"];
        if (subjectPlaceholderFontColor != nil) {
            feedbackViewController.subjectPlaceholderFontColor = [self colorWithHexString:subjectPlaceholderFontColor];
        }
    }
}

- (void)setMessageStylingWithStyling:(NSDictionary*) styling andFeedbackViewController:(BFUserFeedbackViewController*) feedbackViewController
{
    NSDictionary* messageStyling = [styling objectForKey:@"messageStyling"];
    if (messageStyling != nil) {
        NSObject* messageFontSize = [messageStyling objectForKey:@"messageFontSize"];
        NSString* messageFont = [messageStyling objectForKey:@"messageFont"];
        if (messageFont != nil && messageFontSize != nil) {
            feedbackViewController.messageFont = [UIFont fontWithName: messageFont size: [TiUtils floatValue:messageFontSize]];
        }
        
        NSString* messageFontColor = [messageStyling objectForKey:@"messageFontColor"];
        if (messageFontColor != nil) {
            feedbackViewController.messageFontColor = [self colorWithHexString:messageFontColor];
        }
        
        NSString* messagePlaceholderFontColor = [messageStyling objectForKey:@"messagePlaceholderFontColor"];
        if (messagePlaceholderFontColor != nil) {
            feedbackViewController.messagePlaceholderFontColor = [self colorWithHexString:messagePlaceholderFontColor];
        }
    }
}

#pragma mark Lifecycle

- (void)startup
{
  // This method is called when the module is first loaded
  // You *must* call the superclass
  [super startup];
  DebugLog(@"[DEBUG] %@ loaded", self);
}

#pragma Public APIs

- (nullable NSString *)appKey
{
    return [Bugfender appKey];
}

- (void)d:(id)args
{
    [self logWithArgs:args andLogLevel:BFLogLevelDefault];
}

- (NSString *)deviceUrl
{
    NSURL *deviceIdentifierUrl = [Bugfender deviceIdentifierUrl];
    return deviceIdentifierUrl != NULL ? deviceIdentifierUrl.absoluteString : NULL;
}

- (void)e:(id)args
{
    [self logWithArgs:args andLogLevel:BFLogLevelError];
}

- (void)enableCrashReporting:(id)args
{
    [Bugfender enableCrashReporting];
}

- (void)enableUIEventLogging:(id)args
{
    [Bugfender enableUIEventLogging];
}

- (void)f:(id)args
{
    [self d:args];
}

- (id)forceEnabled
{
    return NUMBOOL([Bugfender forceEnabled]);
}

- (void)forceSendOnce:(id)args
{
    [Bugfender forceSendOnce];
}

- (void)i:(id)args
{
    [self d:args];
}

- (void)init:(id)args
{
    ENSURE_SINGLE_ARG(args, NSDictionary);
    NSString* appKey = [args objectForKey:@"applicationToken"];
    [Bugfender activateLogger:appKey];
}

- (void)logDefault:(id)args
{
    [self logWithLineNumber:args level:BFLogLevelDefault];
}

- (void)logWarning:(id)args
{
    [self logWithLineNumber:args level:BFLogLevelWarning];
}

- (void)logError:(id)args
{
    [self logWithLineNumber:args level:BFLogLevelError];
}

- (void)logWithLineNumber:(id)args level:(BFLogLevel)logLevel
{
    ENSURE_SINGLE_ARG(args, NSDictionary);
    NSString* lineNumber = [args objectForKey:@"lineNumber"];
    NSString* method = [args objectForKey:@"method"];
    NSString* file = [args objectForKey:@"file"];
    NSString* tag = [args objectForKey:@"tag"];
    NSString* message = [args objectForKey:@"message"];
    
    [Bugfender logWithLineNumber:lineNumber method:method file:file level:logLevel tag:tag message:message];
}

- (id)maximumLocalStorageSize
{
    return NUMLONG([Bugfender maximumLocalStorageSize]);
}

- (id)printToConsole
{
    return NUMBOOL([Bugfender printToConsole]);
}

- (void)removeDeviceKey:(id)key
{
    [Bugfender removeDeviceKey:[TiUtils stringValue:key]];
}

- (NSString *)sendCrash:(id)args
{
    ENSURE_SINGLE_ARG(args, NSDictionary);
    NSString* title = [args objectForKey:@"title"];
    NSString* text = [args objectForKey:@"text"];
    
    NSURL *crashUrl = [Bugfender sendCrashWithTitle:title text:text];
    return crashUrl != NULL ? crashUrl.absoluteString : NULL;
}

- (NSString *)sendIssue:(id)args
{
    ENSURE_SINGLE_ARG(args, NSDictionary);
    NSString* title = [args objectForKey:@"title"];
    NSString* text = [args objectForKey:@"text"];
    
    NSURL *issueUrl = [Bugfender sendIssueReturningUrlWithTitle:title text:text];
    return issueUrl != NULL ? issueUrl.absoluteString : NULL;
}

- (NSString *)sendUserFeedback:(id)args
{
    ENSURE_SINGLE_ARG(args, NSDictionary);
    NSString* title = [args objectForKey:@"title"];
    NSString* text = [args objectForKey:@"message"];
    
    NSURL *userFeedbackUrl =  [Bugfender sendUserFeedbackReturningUrlWithSubject:title message:text];
    return userFeedbackUrl != NULL ? userFeedbackUrl.absoluteString : NULL;
}

- (NSString *)sessionUrl
{
    NSURL *sessionIdentifierUrl = [Bugfender sessionIdentifierUrl];
    return sessionIdentifierUrl != NULL ? sessionIdentifierUrl.absoluteString : NULL;
}

- (void)setApiUrl:(id)apiUrl
{
    ENSURE_SINGLE_ARG(apiUrl, NSString);
    [Bugfender setApiURL: apiUrl];
}

- (void)setBaseUrl:(id)baseUrl
{
    ENSURE_SINGLE_ARG(baseUrl, NSString);
    [Bugfender setBaseURL: baseUrl];
}

- (void)setDeviceBoolean:(id)args
{
    ENSURE_SINGLE_ARG(args, NSDictionary);
    NSString* key = [args objectForKey:@"key"];
    BOOL boolean = [args objectForKey:@"value"];
    
    [Bugfender setDeviceBOOL: boolean forKey: key];
}

- (void)setDeviceDouble:(id)args
{
    ENSURE_SINGLE_ARG(args, NSDictionary);
    NSString* key = [args objectForKey:@"key"];
    double d = [TiUtils doubleValue:[args objectForKey:@"value"]];
    
    [Bugfender setDeviceDouble:d forKey:key];
}

- (void)setDeviceInteger:(id)args
{
    ENSURE_SINGLE_ARG(args, NSDictionary);
    NSString* key = [args objectForKey:@"key"];
    NSInteger integer = [args objectForKey:@"value"];
    
    [Bugfender setDeviceInteger:integer forKey:key];
}

- (void)setDeviceString:(id)args
{
    ENSURE_SINGLE_ARG(args, NSDictionary);
    NSString* key = [args objectForKey:@"key"];
    NSString* string = [args objectForKey:@"value"];
    
    [Bugfender setDeviceString:string forKey:key];
}

- (void)setForceEnabled:(id)enabled
{
    [Bugfender setForceEnabled:[TiUtils boolValue:enabled]];
}

- (void)setMaximumLocalStorageSize:(id)maxLocalStorageSizeParam
{
    [Bugfender setMaximumLocalStorageSize:[TiUtils intValue:maxLocalStorageSizeParam]];
}

- (void)setPrintToConsole:(id)enabled
{
    [Bugfender setPrintToConsole:[TiUtils boolValue:enabled]];
}

- (void)t:(id)args
{
    [self d:args];
}

- (void)showUserFeedbackViewController:(id)args
{
    ENSURE_UI_THREAD(showUserFeedbackViewController, args);
    ENSURE_SINGLE_ARG(args, NSDictionary);
    
    NSString* title = [args objectForKey:@"title"];
    NSString* hint = [args objectForKey:@"hint"];
    NSString* subjectHint = [args objectForKey:@"subjectHint"];
    NSString* messageHint = [args objectForKey:@"messageHint"];
    NSString* sendButtonText = [args objectForKey:@"sendButtonText"];
    NSString* cancelButtonText = [args objectForKey:@"cancelButtonText"];
    KrollCallback* feedbackSentCallback = [args objectForKey:@"feedbackSentCallback"];
    
    NSDictionary* styling = [args objectForKey:@"styling"];

    TiThreadPerformOnMainThread(^{
        BFUserFeedbackNavigationController *nvc = [Bugfender userFeedbackViewControllerWithTitle:title
                                                                                            hint:hint
                                                                              subjectPlaceholder:subjectHint
                                                                              messagePlaceholder:messageHint
                                                                                 sendButtonTitle:sendButtonText
                                                                               cancelButtonTitle:cancelButtonText
                                                                                      completion:^(BOOL feedbackSent, NSURL * _Nullable url) {
                                                                                          if (feedbackSentCallback != nil) {
                                                                                              NSDictionary* dict = @{ @"feedbackSent" : [NSNumber numberWithBool:feedbackSent]};;
                                                                                              NSArray* array = [NSArray arrayWithObjects: dict, nil];
                                                                                              
                                                                                              [feedbackSentCallback call:array thisObject:nil];
                                                                                          }
                                                                                      }];
        if (styling != nil) {
            BFUserFeedbackViewController *feedbackViewController = nvc.feedbackViewController;
            
            [self setHintStylingWithStyling:styling andFeedbackViewController:feedbackViewController];
            [self setSubjectStylingWithStyling:styling andFeedbackViewController:feedbackViewController];
            [self setMessageStylingWithStyling:styling andFeedbackViewController:feedbackViewController];
        }
        [[TiApp controller] presentViewController:nvc animated:YES completion:nil];
    }, NO);
}

- (void)w:(id)args
{
    [self logWithArgs:args andLogLevel:BFLogLevelWarning];
}

- (UIColor *)colorWithHexString:(NSString *)hexString
{
    TiColor *bgcolor = [TiUtils colorValue:hexString];
    return bgcolor.color;
}

@end
