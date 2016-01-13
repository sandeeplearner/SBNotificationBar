//
//  SandeepCustomWindow.m
//  SandeepsNotificationBar
//
//  Created by Sandeep Bhandari on 1/11/16.
//  Copyright © 2016 Sandeep Bhandari. All rights reserved.
//

#import "SBCustomWindow.h"
#import "SBNotificationViewController.h"

@implementation SBCustomWindow

-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    if(CGRectContainsPoint(self.rootViewController.view.frame, point)){
        [(SBNotificationViewController *)self.rootViewController checkIfNotificationBarTappedWithPoint:point andEvent:event];
        return true;
    }
    else{
        return false;
    }
}

//-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    if(CGRectContainsPoint(self.rootViewController.view.frame, point)){
//        [(NotificationViewController *)self.rootViewController checkIfNotificationBarTappedWithPoint:point andEvent:event];
//        return [super hitTest:point withEvent:event];
//    }
//    else{
//        return nil;
//    }
//}
@end
