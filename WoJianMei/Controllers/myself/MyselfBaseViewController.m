//
//  MyselfBaseViewController.m
//  WoJianMei
//
//  Created by Tom Callon  on 2/22/14.
//
//

#import "MyselfBaseViewController.h"
#import "ImageManager.h"
#import "IIViewDeckController.h"

@interface MyselfBaseViewController ()

@end

@implementation MyselfBaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)initUI
{
    
    if (_isFromLeftNavigation) {
        
    ////leftBtn
    UIButton *leftBtn = [[[UIButton alloc] init] autorelease];
    
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"NavigationButtonBG.png"]
                       forState:UIControlStateNormal];
    
    [leftBtn setImage:[UIImage imageNamed:@"Navigation_Home.png"] forState:UIControlStateNormal];
    leftBtn.frame = CGRectMake(0.0, 0.0, 53.0, 30.0);
    [leftBtn addTarget:self action:@selector(leftButtonClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:leftBtn] autorelease];
    
    }
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self initUI];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
}
- (void)leftButtonClickHandler:(id)sender
{
    [self.viewDeckController toggleLeftViewAnimated:YES];
}
- (void)rightButtonClickHandler:(id)sender
{
    [self.viewDeckController toggleRightViewAnimated:YES];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
