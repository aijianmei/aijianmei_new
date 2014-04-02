//
//  SettingsViewController.m
//  WoJianMei
//
//  Created by Tom Callon  on 2/17/14.
//
//

#import "SettingsViewController.h"
#import "MobClick.h"
#import "FeedbackViewController.h"
#import "ProfileSettingsViewController.h"
#import "PlanSettingsViewController.h"
#import "PushSettingsViewController.h"
#import "PrivacySettingsViewController.h"
#import "PreferenceSettingsViewController.h"
#import "PasswordViewController.h"
#import "AccountManagementController.h"
#import "UIImageView+WebCache.h"
#import "DeviceDetection.h"
#import "UMFeedbackViewController.h"





 typedef  enum {
    
    CellContentTypeProfileSettings = 0,
    CellContentTypePlanManagerment = 1,
    CellContentTypePersonnalPreference = 2,
    CellContentTypePrivacySettings = 3,
    CellContentTypePushSettings = 4,
    CellContentTypePasswordSettings = 5,
    CellContentTypeAccountManagement = 6,
    CellContentTypeQuitAccount = 7



} CellContentType ;



@interface SettingsViewController ()

@end

@implementation SettingsViewController
@synthesize buttonFeedBack =_buttonFeedBack;
@synthesize buttonContactUs =_buttonContactUs;


-(void)dealloc{
    [_buttonContactUs release];
    [_buttonFeedBack release];
    [super dealloc];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
 
    [UMFeedback setLogEnabled:YES];
    _umFeedback = [UMFeedback sharedInstance];
    [_umFeedback setAppkey:UMENG_APPKEY delegate:self];

    
    [self initButtons];
    
    //设置table 是否可以滑动
    [self.dataTableView setScrollEnabled:YES];
    
    //设置标题
    [self setTitle:@"设置"];
    
    //设置内容
    self.dataList = [NSArray arrayWithObjects:
                     @"个人资料",
                     @"课程管理",
                     @"个性设置",
                     @"隐私设置",
                     @"推送设置",
                     @"安全设置",
                     @"账号管理",
                     @"退出账号",
                     @"42",
                     @"43",
                     @"44",
                     @"45",
                     @"46",
                     @"47",
                     @"47",
                     @"47",nil];
    
}



#pragma mark --
#pragma mark - UMFeedback Methods
- (void)showNativeFeedbackWithAppkey:(NSString *)appkey {
    UMFeedbackViewController *feedbackViewController = [[UMFeedbackViewController alloc] initWithNibName:@"UMFeedbackViewController" bundle:nil];
    feedbackViewController.appkey = appkey;
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:feedbackViewController];
    navigationController.navigationBar.barStyle = UIBarStyleDefault;
    navigationController.navigationBar.translucent = YES;
    
    [navigationController.navigationBar setTintColor:[UIColor whiteColor]];
 	[ navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:66.0/255.0 green:155.0/255.0 blue:255.0/255.0 alpha:1.0]];
    
    [self presentViewController:navigationController animated:YES completion:NULL];
}



#pragma mark --
#pragma mark - InitBUTTONS
-(void)initButtons{
    
    [self.buttonFeedBack addTarget:self action:@selector(clickButtonFeedBack:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.buttonFeedBack addTarget:self action:@selector(clickButtonContactUs:) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark --
#pragma mark - ClickButtonsMethods
-(void)clickButtonFeedBack:(id)sender{
  /* FeedbackViewController *feedVC = [[FeedbackViewController alloc]initWithNibName:@"FeedbackViewController" bundle:nil];
    [self.navigationController pushViewController:feedVC    animated:YES];
    [feedVC release];
    */
    
    [self showNativeFeedbackWithAppkey:UMENG_APPKEY];

}
-(void)clickButtonContactUs:(id)sender{
    
}


#pragma mark --
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.dataList count]/2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    

    UITableViewCell *cell = [dataTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        
    }

    
    // Configure the cell...
    [cell.textLabel setText:[NSString stringWithFormat:@"%@",[self.dataList objectAtIndex:indexPath.row]]];

    
    
    //Text color
    [cell.textLabel setTextColor:[UIColor grayColor]];
    
    
    ///Set Images
     NSString *imageName =[NSString stringWithFormat:@"%@",[self.dataList objectAtIndex:indexPath.row + [self.dataList count]/2]];
    [cell.imageView setImage:[UIImage imageNamed:imageName]];
    
    
    //Set the indecator
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    /*
     CellContentTypeProfileSettings = 0,
     CellContentTypePlanManagerment = 1,
     CellContentTypePersonnalPreference = 2,
     CellContentTypePrivacySettings = 3,
     CellContentTypePushSettings = 4,
     CellContentTypePasswordSettings = 5,
     CellContentTypeAccountManagement = 6

     */
    

    switch (indexPath.row) {
        case CellContentTypeProfileSettings:
        {
            
            if (isIPad) {

            ProfileSettingsViewController *profileVC = [[ProfileSettingsViewController alloc]initWithNibName:@"ProfileSettingsViewController~ipad" bundle:nil];
            [profileVC.view setFrame:CGRectMake(400, 64,728, 704)];
            [self.view addSubview:profileVC.view];
            [profileVC.view release];
                
            }else{
            
                ProfileSettingsViewController *profileVC = [[ProfileSettingsViewController alloc]initWithNibName:@"ProfileSettingsViewController" bundle:nil];
                [self.navigationController pushViewController:profileVC animated:YES];
                [profileVC release];
            
            }
            
            
            
 
        }
            break;
            
        case CellContentTypePlanManagerment:
        {
            if (isIPad) {
            
            PlanSettingsViewController *profileVC = [[PlanSettingsViewController alloc]initWithNibName:@"PlanSettingsViewController~ipad" bundle:nil];
            [profileVC.view setFrame:CGRectMake(400, 64,728, 704)];
            [self.view addSubview:profileVC.view];
            [profileVC.view release];
                
            }else{
                
            PlanSettingsViewController *profileVC = [[PlanSettingsViewController alloc]initWithNibName:@"PlanSettingsViewController" bundle:nil];
                [self.navigationController pushViewController:profileVC animated:YES];
                [profileVC release];
                
            }
            
        }
            break;

        case CellContentTypePersonnalPreference:
        {
            if (isIPad) {
                
                PreferenceSettingsViewController *profileVC = [[PreferenceSettingsViewController alloc]initWithNibName:@"PreferenceSettingsViewController~ipad" bundle:nil];
                [profileVC.view setFrame:CGRectMake(400, 64,728, 704)];
                [self.view addSubview:profileVC.view];
                [profileVC.view release];
            }else{
                
                PreferenceSettingsViewController *profileVC = [[PreferenceSettingsViewController alloc]initWithNibName:@"PreferenceSettingsViewController" bundle:nil];
                
                [self.navigationController pushViewController:profileVC animated:YES];
                [profileVC release];
                
            }

            
        }
            break;

        case CellContentTypePrivacySettings:
        {
            if (isIPad) {
                
            PrivacySettingsViewController *profileVC = [[PrivacySettingsViewController alloc]initWithNibName:@"PrivacySettingsViewController~ipad" bundle:nil];
            [profileVC.view setFrame:CGRectMake(400, 64,728, 704)];
            [self.view addSubview:profileVC.view];
            [profileVC.view release];
            }else{
                
                PrivacySettingsViewController *profileVC = [[PrivacySettingsViewController alloc]initWithNibName:@"PrivacySettingsViewController" bundle:nil];

                [self.navigationController pushViewController:profileVC animated:YES];
                [profileVC release];
 
            }

            
        }
            break;
        case CellContentTypePushSettings:
        {
            if (isIPad) {
                
            PushSettingsViewController *profileVC = [[PushSettingsViewController alloc]initWithNibName:@"PushSettingsViewController~ipad" bundle:nil];
            [profileVC.view setFrame:CGRectMake(400, 64,728, 704)];
            [self.view addSubview:profileVC.view];
            [profileVC.view release];
                
            }else {
                PushSettingsViewController *profileVC = [[PushSettingsViewController alloc]initWithNibName:@"PushSettingsViewController" bundle:nil];
                [self.navigationController pushViewController:profileVC animated:YES];
                [profileVC release];
            
            }

            
        }
            break;
        case CellContentTypePasswordSettings:
        {
            
            if (isIPad) {
                
            PasswordViewController *passwordVC = [[PasswordViewController alloc]initWithNibName:@"PasswordViewController~ipad" bundle:nil];
                [passwordVC.view setFrame:CGRectMake(400, 64,728, 704)];
                [self.view addSubview:passwordVC.view];
                [passwordVC.view release];

            }else{
            
            PasswordViewController *passwordVC = [[PasswordViewController alloc]initWithNibName:@"PasswordViewController" bundle:nil];
            [self.navigationController pushViewController:passwordVC animated:YES];
            [passwordVC release];
                
            }
        }
            break;
        case CellContentTypeAccountManagement:
        {
            
            if (isIPad) {
                
                AccountManagementController *vc = [[AccountManagementController alloc]initWithNibName:@"AccountManagementController~ipad" bundle:nil];
                [vc.view setFrame:CGRectMake(400, 64,728, 704)];
                [self.view addSubview:vc.view];
                [vc.view release];
                
            }else{
                
                AccountManagementController *vc = [[AccountManagementController alloc]initWithNibName:@"AccountManagementController" bundle:nil];
                [self.navigationController pushViewController:vc animated:YES];
                [vc release];
                
            }
        }
            break;
        case CellContentTypeQuitAccount:
        {
            
            if (isIPad) {
                
                [self  showAlertView];
                
            }else{
                
                [self showAlertView];
                
            }
        }
            break;


            
        default:
            break;
    }
    
   
    
    if (isIPad) {

    //Settings Title
    NSString *title = [NSString stringWithFormat:@"设置:%@", [self.dataList objectAtIndex:indexPath.row]];
    [self setTitle:title];
        
    }else{
        NSString *title = [NSString stringWithFormat:@"设置"];
        [self setTitle:title];
    }
}



#pragma mark --
#pragma mark -  RightButtonClickHandler Method
- (void)rightButtonClickHandler:(id)sender
{
    [self showAlertView];
}


#pragma mark --
#pragma mark -  ShowAlertView Method
-(void)showAlertView{
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"登出账号" message:@"登出账号，将会删除用户数据!" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alertView show];
    [alertView release];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    enum ButtonIndex {
    		CancleIndex,
    		LogoutIndex,
    };

    switch (buttonIndex) {
        case CancleIndex:
        {
            PPDebug(@"User Cancle");
        }
            break;
        case LogoutIndex:
        {
            PPDebug(@"User Logout");
            [self popupHappyMessage:@"登出成功" title:nil];

        }
            break;
            
        default:
            break;
    }

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
