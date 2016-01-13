# SBNotificationBar

## About:
SBNotification bar is a simple,reusable and drag and drop copmonent to show the custom notification bar on top of status bar and navigation bar. SBNotificationBar can also play notification sounds when displayed.
I have tried my best to keep things simple and easy to use. There are plenty of customization options available, modify them according to your need.

## How to use??
Hmmm.... I'll say its easier than you thought :) Here is the code to use it.

    SBNotificationViewController *notificationViewController = [SBNotificationViewController sharedManager];
    [notificationViewController showAlertNotificationWithText:@"your text here" andTitle:@"your title here" andNotificationImage:[UIImage imageNamed:@"notification_image_you_wanna_show"] withCallback:^{
        //controll will come back to this dialog when user taps on notification bar
        NSLog(@"User tapped notification bar");
    }];

Callback block will be called when user taps on the notifcation bar and dismisses it. If user taps close button and closes notification bar, call back will not be triggerred.

That sounds easy, isn't it? Anyway That's not all!! You can cusomize most of the properties of notification bar.
Let's start with changing the background color of the notification bar.

    SBNotificationViewController *notificationViewController = [SBNotificationViewController sharedManager];
    notificationViewController.backgroundColorOfNotificationBar = [UIColor colorWithRed:0.8 green:0.9 blue:1.0 alpha:1.0];
    
SBNotificationBar gets dismissed automatically, if user does not take any action on it after 3 seconds by default. If you wish to disable automatic dismiss just say:
```
    notificationViewController.isAutomaticDismissAllowed = NO;
```
On the other hand, if you wish to dismiss it automatically but wants to controll the duration of automatic dismiss
```
    notificationViewController.durationOfMessageDisplayBeforeAutomaticDismissal = 1.0;
```
By Default SBNotificationBar shows and hides the notification bar with animation having duration 0.5. If you want to speed up / slow down the animation 
```
    notificationViewController.notificationBarDisplayAndHideAnimationDuration = 1.0;
```
SBNotificationBar dismisses notification bar on tapping bar / on tapping close (cross) button in notification bar. By default it shows and hides the notification bar using default animation. But if you want to dismiss notification bar with different animation, I've got few of the for you :)

you can use one of the below to dismiss the notification bar.
   | Default,      |
   |CrossDissolve, |
   |CurlUp,        |
   |FlipFromBottom,|
   |FlipFromLeft,  |
   |FlipFromRight  |

How to set? Thats easy :)
```
    notificationViewController.selectedHideAnimationType = CurlUp;
```
Did I mention SBNotificationBar plays sounds as well ? Enable sound with
```
    notificationViewController.shouldPlaySound = YES;
```
If you want to use specific sound, here are the few SBNotificationBar currently supports.

