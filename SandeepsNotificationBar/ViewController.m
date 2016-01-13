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
    notificationViewController.isAutomaticDismissAllowed = NO;
    notificationViewController.durationOfMessageDisplayBeforeAutomaticDismissal = 5.0;
    
    [notificationViewController showAlertNotificationWithText:@"sandeep here testing abcd efgh ijkl mnop qrst uvw xyz 1234567890098765432112345678900987654321" andTitle:@"testing" andNotificationImage:[UIImage imageNamed:@"tom.gif"] andCompletionBlock:^{
        NSLog(@"User tapped notification bar");
    }];
}

@end
