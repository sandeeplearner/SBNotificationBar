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

//shows image passed as notification image
@property (nonatomic,strong) UIImage *notificationImage;

//decides the speed of animation of notification bar display and hiding
@property (nonatomic) float notificationBarDisplayAndHideAnimationDuration;


//methods
+ (id)sharedManager;
-(void)showAlertNotificationWithText:(NSString *)notificationText andTitle:(NSString *)notificationTitle andNotificationImage:(UIImage *)notificationImage andCompletionBlock:(callback)completionBlock;
-(void)checkIfNotificationBarTappedWithPoint:(CGPoint) point andEvent:(UIEvent *)event;
@end
