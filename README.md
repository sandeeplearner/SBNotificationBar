# SBNotificationBar

## About:
SBNotification bar is a simple,reusable and drag and drop copmonent to show the custom notification bar on top of status bar and navigation bar.
I have tried my best to keep things simple and easy to use. There are plenty of customization options available, modify them according to your need.

## How to use??
Hmmm.... I'll say its easier than you thought :) Here is the code to use it.

    SBNotificationViewController *notificationViewController = [SBNotificationViewController sharedManager];
    [notificationViewController showAlertNotificationWithText:@"your text here" andTitle:@"your title here" andNotificationImage:[UIImage imageNamed:@"notification_image_you_wanna_show"] withCallback:^{
        //controll will come back to this dialog when user taps on notification bar
        NSLog(@"User tapped notification bar");
    }];

That sounds easy, isn't it? Anyway That's not all!! You can cusomize most of the properties of notification bar.
