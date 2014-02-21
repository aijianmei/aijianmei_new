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
#import "UIImageView+WebCache.h"
#import "DeviceDetection.h"




 typedef  enum {
    
    CellContentTypeProfileSettings = 0,
    CellContentTypePlanManagerment = 1,
    CellContentTypePersonnalPreference = 2,
    CellContentTypePrivacySettings = 3,
    CellContentTypePushSettings = 4,
    CellContentTypePasswordSettings = 5

} CellContentType ;



@interface SettingsViewController ()

@end

@implementation SettingsViewController

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
                     @"1.png",
                     @"2.png",
                     @"3.png",
                     @"1.png",
                     @"2.png",
                     @"3.png", nil];
    
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
    CellContentTypePasswordSettings = 5
     */
    

    switch (indexPath.row) {
        case CellContentTypeProfileSettings:
        {
            
            if (isIPad) {

            ProfileSettingsViewController *profileVC = [[ProfileSettingsViewController alloc]initWithNibName:@"ProfileSettingsViewController" bundle:nil];
            [profileVC.view setFrame:CGRectMake(320, 64,728, 704)];
            [self.view addSubview:profileVC.view];
            [profileVC release];
                
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
            [profileVC.view setFrame:CGRectMake(320, 64,728, 704)];
            [self.view addSubview:profileVC.view];
            [profileVC release];
                
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
                [profileVC.view setFrame:CGRectMake(320, 64,728, 704)];
                [self.view addSubview:profileVC.view];
                [profileVC release];
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
            [profileVC.view setFrame:CGRectMake(320, 64,728, 704)];
            [self.view addSubview:profileVC.view];
            [profileVC release];
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
            [profileVC.view setFrame:CGRectMake(320, 64,728, 704)];
            [self.view addSubview:profileVC.view];
            [profileVC release];
                
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




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
