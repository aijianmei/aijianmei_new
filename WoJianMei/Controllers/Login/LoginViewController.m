//
//  LoginViewController.m
//  WoJianMei
//
//  Created by Tom Callon  on 4/3/14.
//
//

#import "LoginViewController.h"
#import "AppDelegate.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

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

-(IBAction)didClickLoginButton:(id)sender{
    
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
    [self dismissViewControllerAnimated:YES completion:NULL];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
