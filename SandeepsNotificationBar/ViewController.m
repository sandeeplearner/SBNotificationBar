//
//  ViewController.m
//  SandeepsNotificationBar
//
//  Created by Sandeep Bhandari on 1/11/16.
//  Copyright © 2016 Sandeep Bhandari. All rights reserved.
//

#import "ViewController.h"
#import "SBNotificationBar/SBNotificationViewController.h"

@interface ViewController (){
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showNotificationBar:(id)sender {
    SBNotificationViewController *notificationViewController = [SBNotificationViewController sharedManager];
    notificationViewController.shouldPlaySound = YES;
    notificationViewController.notificationSound = voicemail;
    [notificationViewController showAlertNotificationWithText:@"Notification Text" andTitle:@"Notification Title" andNotificationImage:[UIImage imageNamed:@"tom.gif"] withCallback:^{
        NSLog(@"User tapped notification bar");
    }];
}

@end
