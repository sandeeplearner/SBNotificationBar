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

That sounds easy, isn't it? Anyway That's not all!! You can cusomize most of the properties of notification bar.
Let's start with changing the background color of the notification bar.

    SBNotificationViewController *notificationViewController = [SBNotificationViewController sharedManager];
    notificationViewController.backgroundColorOfNotificationBar = [UIColor colorWithRed:0.8 green:0.9 blue:1.0 alpha:1.0];
    
SBNotificationBar gets dismissed automatically, if user does not take any action on it after 3 seconds by default. If you wish to disable automatic dismiss just say:
    notificationViewController.isAutomaticDismissAllowed = NO;

On the other hand, if you wish to dismiss it automatically but wants to controll the duration of automatic dismiss
    notificationViewController.durationOfMessageDisplayBeforeAutomaticDismissal = 1.0;
