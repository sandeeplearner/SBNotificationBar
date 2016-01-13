//
//  NotificationViewController.h
//  SandeepsNotificationBar
//
//  Created by Sandeep Bhandari on 1/11/16.
//  Copyright © 2016 Sandeep Bhandari. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^callback)(void);
typedef enum hideAnimationEnum{
    Default,
    CrossDissolve,
    CurlUp,
    FlipFromBottom,
    FlipFromLeft,
    FlipFromRight
} hideAnimation;

typedef enum allowedSystemSounds{
    new_mail = 1000,
    voicemail = 1002,
    received_message = 1003,
    sms_received1 = 1005,
    sms_received2 = 1006,
    sms_received3 = 1007,
    sms_received4 = 1008
} notificationSoundsList;
@interface SBNotificationViewController : UIViewController
//decides whether automatically notification bar should be removed or not
@property (nonatomic) BOOL isAutomaticDismissAllowed;

//decides the duration for which message will be displayed before automatically dismissed
//has no effects if isAutomaticDismissAllowed is set to false.
@property (nonatomic) NSInteger durationOfMessageDisplayBeforeAutomaticDismissal;

//decides animation used to hide notification bar
@property (nonatomic) hideAnimation selectedHideAnimationType;

//decides the background color of notification bar
@property (nonatomic,strong) UIColor *backgroundColorOfNotificationBar;

//decides the speed of animation of notification bar display and hiding
@property (nonatomic) float notificationBarDisplayAndHideAnimationDuration;

//decides whether or not to play sound when notification displayed
@property (nonatomic) BOOL shouldPlaySound;

//plays the user selected sounds
@property (nonatomic) notificationSoundsList notificationSound;
//methods
+ (id)sharedManager;
-(void)showAlertNotificationWithText:(NSString *)notificationText andTitle:(NSString *)notificationTitle andNotificationImage:(UIImage *)notificationImage withCallback:(callback)callback;
-(void)checkIfNotificationBarTappedWithPoint:(CGPoint) point andEvent:(UIEvent *)event;
@end
