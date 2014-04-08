//
//  WorkoutListViewController.m
//  WoJianMei
//
//  Created by Tom Callon  on 2/17/14.
//
//

#import "WorkoutListViewController.h"

@interface WorkoutListViewController ()

@end

@implementation WorkoutListViewController

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
    [self setTitle:@"锻炼汇"];

    
    self.dataList = [NSArray arrayWithObjects:
                     @"class1.png",
                     @"class2.png",
                     @"class3.png",
                     nil];

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
//    [cell.textLabel setText:[NSString stringWithFormat:@"%@",[self.dataList objectAtIndex:indexPath.row]]];
//
//    //Text color
//    [cell.textLabel setTextColor:[UIColor grayColor]];
//    [cell.imageView setImage:[UIImage imageNamed:@"tomcallon.png"]];
    
    
    CGRect frame;
    if (ISIPAD) {
        frame =CGRectMake(0, 0, self.view.frame.size.width,600);
    }else{
         frame =CGRectMake(0, 0, 320,300);

    }
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    UIImage *image = [ UIImage imageNamed:[self.dataList objectAtIndex:indexPath.row]];
    [imageView setImage:image];
    [cell addSubview:imageView];
    
    
    
    return cell;
}


#pragma mark --
#pragma mark - heightForRowAtIndexPath

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (ISIPAD) {
        
        return  600;
        
    }
    
        return 150;
}


#pragma mark --
#pragma mark - DidSelectRowAtIndexPath
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIAlertView *alertView =[[UIAlertView alloc]initWithTitle:@"购买或选择免费课程"
                                                      message:@"购买课程前,您可以试用一个月"
                                                     delegate:self
                                            cancelButtonTitle:@"取消"
                                            otherButtonTitles:@"试用", nil];
    [alertView show];
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{


    switch (buttonIndex) {
        case 0:
        {
            
        }
            break;
        case 1:
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
