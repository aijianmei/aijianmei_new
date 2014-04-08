//
//  SignUpViewController.m
//  WoJianMei
//
//  Created by Tom Callon  on 4/3/14.
//
//

#import "SignUpViewController.h"
#import "AppDelegate.h"



@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(IBAction)didClickSignUpButton:(id)sender{
    [self showProgressHUDActivityWithText:@"登陆中..."];
    
    [self performSelector:@selector(loginDemo) withObject:nil afterDelay:1];
    
}

-(void)loginDemo{
    [self hideProgressHUDActivity];
    [self dismissViewControllerAnimated:NO
                             completion:^{
                                 [[AppDelegate getAppDelegate] dismissWelcomeage];
                                 
                             } ];
}



-(IBAction)didClickBackButton:(id)sender{
    [self dismissViewControllerAnimated:YES
                             completion:^{} ];

}

-(IBAction)didClickVerificationCodeButton:(id)sender{
    
    
}
-(IBAction)didClickSendButton:(id)sender{

    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
