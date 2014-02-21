//
//  ProfileInfoViewController.m
//  WoJianMei
//
//  Created by Tom Callon  on 2/20/14.
//
//

#import "ProfileSettingsViewController.h"


typedef  enum {
    
    AvatarSettings = 0,
    NameSettings = 1,
    EmailSettings = 2,
    HeightSettings = 3,
    WeightSettings = 4,
    AgeSettings = 5,
    GenderSettings = 6

    
} ProfileSettingsType ;



@interface ProfileSettingsViewController ()

@end

@implementation ProfileSettingsViewController

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
    
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setTitle:@"个人资料"];
    self.dataList = [NSArray arrayWithObjects:
                     @"修改头像",
                     @"用户名",
                     @"邮箱",
                     @"身高",
                     @"体重",
                     @"年龄",
                     @"性别",nil];
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
    return [self.dataList count];
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
    NSString *imageName =[NSString stringWithFormat:@"%@",[self.dataList objectAtIndex:indexPath.row]];
    [cell.imageView setImage:[UIImage imageNamed:imageName]];
    
    
    //Set the indecator
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    return cell;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    /*
     
     
     typedef  enum {
     
     AvatarSettings = 0,
     NameSettings = 1,
     EmailSettings = 2,
     HeightSettings = 3,
     WeightSettings = 4,
     AgeSettings = 5,
     GenderSettings = 5
     
     
     } ProfileSettingsType ;
     */
    
    
    switch (indexPath.row) {
        case AvatarSettings:
        {
            
        }
            break;
            
        case NameSettings:
        {
            
        }
            break;
        case HeightSettings:
        {
            
        }
            break;
        case WeightSettings:
        {
            
        }
            break;
        case AgeSettings:
        {
            
        }
            break;
        case GenderSettings:
        {
            
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
