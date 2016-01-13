//
//  NotificationViewController.m
//  SandeepsNotificationBar
//
//  Created by Sandeep Bhandari on 1/11/16.
//  Copyright © 2016 Sandeep Bhandari. All rights reserved.
//

#import "SBNotificationViewController.h"
#import "SBCustomWindow.h"


@interface SBNotificationViewController (){
    SBCustomWindow *keyWindow;
    NSLayoutConstraint *yAxisConstraint;
    NSTimer *_timer;
}
@property (strong, nonatomic) IBOutlet UILabel *notificationTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *notificationMessageBody;
@property (strong, nonatomic) IBOutlet UIButton *cancelButton;
@property (nonatomic, copy) callback completionBlock;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *imageLeadingSpaceConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *imageHeightConstraint;
@property (strong, nonatomic) IBOutlet UIImageView *notificationImageView;
@end

@implementation SBNotificationViewController

-(id)init{
    self=[super init];
    
    NSArray *subviewArray = [[NSBundle mainBundle] loadNibNamed:@"SBNotificationBarView" owner:self options:nil];
    UIView *mainView = [subviewArray objectAtIndex:0];
    self.view =  mainView;
    
    keyWindow= [[SBCustomWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    keyWindow.windowLevel = UIWindowLevelAlert;
    keyWindow.rootViewController = self;
    [keyWindow makeKeyAndVisible];
    
    [keyWindow.rootViewController.view setTranslatesAutoresizingMaskIntoConstraints:NO];
    UIView *currentView = keyWindow.rootViewController.view;
    NSDictionary *viewComponents = NSDictionaryOfVariableBindings(currentView);
    
    NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|-(0)-[currentView]-(0)-|" options:0 metrics:nil views:viewComponents];
    NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(0)-[currentView(88)]-(>=8)-|" options:0 metrics:nil views:viewComponents];
    yAxisConstraint =  [verticalConstraints objectAtIndex:0];
    
    [keyWindow addConstraints:horizontalConstraints];
    [keyWindow addConstraints:verticalConstraints];
    [keyWindow layoutIfNeeded];
    self.isAutomaticDismissAllowed = YES ;
    self.selectedHideAnimationType = Default;
    self.durationOfMessageDisplayBeforeAutomaticDismissal = 3.0;
    self.backgroundColorOfNotificationBar = [UIColor colorWithRed:0 green:122.0/255.0 blue:255.0/255.0 alpha:1.0];
    self.notificationBarDisplayAndHideAnimationDuration = 0.5;
    
    self.imageLeadingSpaceConstraint.constant =0;
    self.imageHeightConstraint.constant = 0;
    [self.view layoutIfNeeded];
    [self.view setBackgroundColor:self.backgroundColorOfNotificationBar];
    return self;
}

+ (id)sharedManager {
    static SBNotificationViewController *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showAlertNotificationWithText:(NSString *)notificationText andTitle:(NSString *)notificationTitle andNotificationImage:(UIImage *)notificationImage andCompletionBlock:(callback)completionBlock{
    yAxisConstraint.constant =-88;
    [keyWindow layoutIfNeeded];
    [self.notificationTitleLabel setText:notificationTitle];
    [self.notificationMessageBody setText:notificationText];
    self.completionBlock = completionBlock;
    
    if(notificationImage){
        [self.imageLeadingSpaceConstraint setConstant:8];
        [self.imageHeightConstraint setConstant:66];
        [self.notificationImageView setImage:notificationImage];
    }
    
    [UIView animateWithDuration:self.notificationBarDisplayAndHideAnimationDuration animations:^{
        yAxisConstraint.constant =0;
        [keyWindow layoutIfNeeded];
    }];
    
    if(self.isAutomaticDismissAllowed){
        [self startDismissalTimer];
    }
}

-(void)startDismissalTimer{
    if ([_timer isValid]) {
        [_timer invalidate];
    }
    _timer = [NSTimer scheduledTimerWithTimeInterval:self.durationOfMessageDisplayBeforeAutomaticDismissal target:self selector:@selector(hideAlertNotification) userInfo:nil repeats:NO];
}

- (void)stopTimer {
    if ([_timer isValid]) {
        [_timer invalidate];
    }
    _timer = nil;
}


-(void)hideAlertNotification{
    if(self.selectedHideAnimationType == Default){
        [UIView animateWithDuration:self.notificationBarDisplayAndHideAnimationDuration animations:^{
            yAxisConstraint.constant = -88;
            [keyWindow layoutIfNeeded];
        }];
    }
    else{
        UIViewAnimationOptions selectedOption;
        switch (self.selectedHideAnimationType) {
            case CrossDissolve:
                selectedOption = UIViewAnimationOptionTransitionCrossDissolve;
                break;
            case FlipFromBottom:
                selectedOption = UIViewAnimationOptionTransitionFlipFromBottom;
                break;
                
            case FlipFromLeft:
                selectedOption = UIViewAnimationOptionTransitionFlipFromLeft;
                break;
                
            case FlipFromRight:
                selectedOption = UIViewAnimationOptionTransitionFlipFromRight;
                break;
                
            case CurlUp:
                selectedOption = UIViewAnimationOptionTransitionCurlUp;
                break;
            default:
                break;
        }
        [UIView transitionWithView:keyWindow.rootViewController.view
                          duration:self.notificationBarDisplayAndHideAnimationDuration
                           options:selectedOption
                        animations:^{
                            [keyWindow.rootViewController.view setHidden:YES];
                        } completion:^(BOOL finished) {
                            double delayInSeconds = 0.3;
                            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
                            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                                yAxisConstraint.constant = -88;
                                [keyWindow layoutIfNeeded];
                                [keyWindow.rootViewController.view setHidden:NO];
                            });
                            
                        }];
    }
    [self stopTimer];
}

- (IBAction)closeNotification:(id)sender {
    [self hideAlertNotification];
}

#pragma mark - handle touch event
-(void)checkIfNotificationBarTappedWithPoint:(CGPoint)point andEvent:(UIEvent*)event{
    if(self.completionBlock && !CGRectContainsPoint(self.cancelButton.frame, point)){
        [self performSelector:@selector(sendControlBackToUserViewController) withObject:nil];
    }
}

-(void)sendControlBackToUserViewController{
    [self hideAlertNotification];
    self.completionBlock();
    self.completionBlock = nil;
}
@end
