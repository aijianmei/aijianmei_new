//
//  HomeViewController.m
//  WoJianMei
//
//  Created by Tom Callon  on 2/17/14.
//
//

#import "HomeViewController.h"
#import "IIViewDeckController.h"
#import "ImageManager.h"
#import "UIImageView+WebCache.h"
#import "SessionPreviewViewController.h"

#import "MyselfViewController.h"



@interface HomeViewController ()
@end

@implementation HomeViewController
@synthesize headerView =_headerView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)dealloc{
    [_headerView release];
    [super dealloc];
}

-(void)initTableHeaderView{
    
    UIView *view =[[UIView alloc]init];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
        [view setFrame: CGRectMake(0,0,UIScreen.mainScreen.bounds.size.width, 310)];
    }else{
        [view setFrame: CGRectMake(0,0,UIScreen.mainScreen.bounds.size.width - 150, 360.0f)];
    }
    
     self.headerView = view;
    
    UITapGestureRecognizer  *tapCgr = [[UITapGestureRecognizer alloc]   initWithTarget:self action:@selector(clickHeaderViewAction:)];
    tapCgr.numberOfTapsRequired=1;
    tapCgr.delegate =self;
    [self.headerView addGestureRecognizer:tapCgr];
    [tapCgr release];
    
    
    //设置图片
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:view.frame];
    [imageView setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@"homeMain.png"]];
    [self.headerView addSubview:imageView];
    

    [self.dataTableView setTableHeaderView:_headerView];
}

-(void)clickHeaderViewAction:(id)sender{
    
    if (ISIPAD) {
        SessionPreviewViewController *vc = [[ SessionPreviewViewController alloc]initWithNibName:@"SessionPreviewViewController~ipad" bundle:nil];
        [self.navigationController pushViewController:vc animated:NO];
        [vc release];
    
    }else{
        SessionPreviewViewController *vc = [[ SessionPreviewViewController alloc]initWithNibName:@"SessionPreviewViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:NO];
        [vc release];
    
    }


}


-(void)initLeftButton{
    ////rightBtn
    UIButton *rightBtn = [[[UIButton alloc] init] autorelease];
    [rightBtn setImage:[ImageManager GobalNavigationAvatarImage] forState:UIControlStateNormal];
    rightBtn.frame = CGRectMake(0.0, 0.0, 49.0, 29.0);
    [rightBtn addTarget:self action:@selector(rightButtonClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:rightBtn] autorelease];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    
    
    [self initLeftButton];
    [self initTableHeaderView];
    [self setTitle:@"首页"];
    self.dataList = [NSArray arrayWithObjects:
                     @"我今天锻炼了七个动作，感觉我自己身体好了很多哦！",
                     @"我刚刚和小强成为了好朋友哦。!!!",
                     @"我现在要前往健身房去健身了!!!",
                     @"小明，今天锻炼了他的腿部，你要一起吗？",
                     @"欢迎来到爱健美，和我们的健身专家一起去健身哦！", nil];
}



#pragma mark --
#pragma mark - RightButtonClickHandler Method
- (void)rightButtonClickHandler:(id)sender
{
    [self.viewDeckController toggleRightViewAnimated:YES];
    
    MyselfViewController *vc =[[MyselfViewController alloc]initWithNibName:@"MyselfViewController" bundle:nil];
    vc.isFromLeftNavigation = NO;
    [self.navigationController pushViewController:vc animated:YES];
    [vc release];
    
}

#pragma mark --
#pragma mark - Table view Header
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    UIImageView *goView =nil;
    switch (section) {
        case 0:
        {
        
          goView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"gobal_background@2x"] highlightedImage:[UIImage imageNamed:@"gobal_background@2x"]];
        }
            break;
            
        default:
            break;
    }
    
    

    return goView;
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
    [cell.imageView setImage:[UIImage imageNamed:@"tomcallon.png"]];
    
    
    

    
    
    return cell;
}


#pragma mark --
#pragma mark - heightForRowAtIndexPath

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 80;
}


#pragma mark --
#pragma mark - DidSelectRowAtIndexPath
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
