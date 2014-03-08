//
//  AGLeftSideViewController.m
//  AGShareSDKDemo
//
//  Created by 冯 鸿杰 on 13-1-30.
//  Copyright (c) 2013年 vimfung. All rights reserved.
//

#import "AJMLeftSideViewController.h"
#import "AGLeftSideTableCell.h"
#import "HomeViewController.h"
#import "MyselfViewController.h"
#import "FriendsViewController.h"
#import "WorkoutListViewController.h"
#import "WorkoutPlanViewController.h"
#import "SettingsViewController.h"
#import "SVWebViewController.h"
#import "AppDelegate.h"
#import "IIViewDeckController.h"
#import "ColorManager.h"
#import "AnalyticsManager.h"




//爱健美
#define kAppKey @"239725454"
#define kAppSecret @"e2064ac8fab9d889a9eccecc5babad11"


#define TABLE_CELL @"tableCell"




@interface AJMLeftSideViewController ()

@end

@implementation AJMLeftSideViewController

@synthesize homeViewController =_homeViewController;
@synthesize myselfViewController =_myselfViewController;
@synthesize friendsViewController =_friendsViewController;

@synthesize workoutPlanViewController =_workoutPlanViewController;
@synthesize workoutListViewController =_workoutListViewController;
@synthesize settingsViewController =_settingsViewController;

@synthesize webViewController =_webViewController;

- (id)init
{
    self = [super init];
    if (self)
    {
        
        // Custom initialization
        _sectionView = [[AGSectionView alloc] initWithFrame:CGRectZero];
        _sectionView.titleLabel.text = @"关注爱健美";
    }
    return self;
}

- (void)dealloc
{

    [_navigationController release];
    
    [_homeViewController release];
    [_myselfViewController release];
    [_friendsViewController release];
    
    [_workoutPlanViewController release];
    [_workoutListViewController release];
    [_settingsViewController release];
    
    [_webViewController release];
    
    [super dealloc];
}

- (void)viewDidUnload
{
    [self setHomeViewController:nil];
    [self setMyselfViewController:nil];
    [self setFriendsViewController:nil];
    
    [self setWorkoutPlanViewController:nil];
    [self setWorkoutListViewController:nil];
    [self setSettingsViewController:nil];
    
    [self setWebViewController:nil];
    
    [super viewDidUnload];
   
}
- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    

    typedef enum
    {
        SSRectEdgeNone   = 0,
        SSRectEdgeTop    = 1 << 0,
        SSRectEdgeLeft   = 1 << 1,
        SSRectEdgeBottom = 1 << 2,
        SSRectEdgeRight  = 1 << 3,
        SSRectEdgeAll    = SSRectEdgeTop | SSRectEdgeLeft | SSRectEdgeBottom | SSRectEdgeRight
    }
    SSRectEdge;
    
    
    if ([[UIDevice currentDevice].systemVersion isEqualToString:@"7.0"]
        ) {
        [self setExtendedLayoutIncludesOpaqueBars:NO];
        [self setEdgesForExtendedLayout:SSRectEdgeBottom | SSRectEdgeLeft | SSRectEdgeRight];
   }
    

    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"IndexBG.png"]];
    bgImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    bgImageView.frame = CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:bgImageView];
    [bgImageView release];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height)
                                              style:UITableViewStylePlain];
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.sectionHeaderHeight = 32;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.backgroundColor = [UIColor clearColor ];
    _tableView.backgroundView = nil;
    [self.view addSubview:_tableView];
    [_tableView release];
}



#pragma mark --
#pragma mark - initViewControllers
-(void)initHomeViewController
{
    
    if (self.homeViewController ==nil) {
    
        HomeViewController *homeViewVC =[[AppDelegate getAppDelegate]  initHomeViewControllerFromAppDelegate];
        self.homeViewController =homeViewVC;
    }
   
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:_homeViewController];
    self.homeViewController.title = @"首页";
}

-(void)initMyselfController{
    if (self.myselfViewController ==nil) {
        
        MyselfViewController *vc =[[MyselfViewController alloc]initWithNibName:@"MyselfViewController" bundle:nil];
        self.myselfViewController =vc;
        [vc release];
    }
    
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:_myselfViewController];
    self.myselfViewController.isFromLeftNavigation =YES;
    self.myselfViewController.title = @"我";

}

-(void)initFriendsController{
    if (self.friendsViewController ==nil) {
        
        FriendsViewController *vc =[[FriendsViewController alloc]initWithNibName:@"FriendsViewController" bundle:nil];
        self.friendsViewController =vc;
        [vc release];
    }
    
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:_friendsViewController];
    self.friendsViewController.title = @"我的好友";

}



-(void)initWorkoutPlanController{
    if (self.workoutPlanViewController ==nil) {
        
        WorkoutPlanViewController *vc =[[WorkoutPlanViewController alloc]initWithNibName:@"WorkoutPlanViewController" bundle:nil];
        self.workoutPlanViewController =vc;
        [vc release];
    }
    
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:_workoutPlanViewController];
    self.workoutPlanViewController.title = @"锻炼计划";

}


-(void)initWorkoutPlanListController{
    if (self.workoutListViewController ==nil) {
        
        WorkoutListViewController *vc =[[WorkoutListViewController alloc]initWithNibName:@"WorkoutListViewController" bundle:nil];
        self.workoutListViewController =vc;
        [vc release];
    }
    
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:_workoutListViewController];
    self.workoutListViewController.title = @"锻炼汇";

}

-(void)initSettingsController{
    if (self.settingsViewController ==nil) {
        
        SettingsViewController *vc =[[SettingsViewController alloc]initWithNibName:@"SettingsViewController" bundle:nil];
        self.settingsViewController =vc;
        [vc release];
    }
    
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:_settingsViewController];
    self.settingsViewController.title = @"设置";

}







-(void)initWebViewController{
    if (self.webViewController ==nil) {
        self.webViewController = [[SVWebViewController alloc] initWithAddress:@"http://aijianmei.com"];
  }
    self.webViewController.title = @"官方网站";
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:_webViewController];
}


#pragma mark --
#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 6;
        case 1:
            return 2;
        default:
            return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TABLE_CELL];
    if (cell == nil)
    {
        cell = [[[AGLeftSideTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TABLE_CELL] autorelease];
        
        cell.textLabel.font = [UIFont boldSystemFontOfSize:15.0];
        cell.textLabel.textColor = [ColorManager leftSideNaviFontColor] ;
        UIImageView *lineView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"IndexLine.png"] stretchableImageWithLeftCapWidth:1
                                                                                                                topCapHeight:1]];
        
        CGRect frame = cell.contentView.frame;
        
        lineView.frame = CGRectMake(0.0, frame.size.height - lineView.frame.size.height , cell.contentView.frame.size.width, lineView.frame.size.height);
        
        lineView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
          [cell addSubview:lineView];
          [lineView release];
    
    }
    
    
    UIImageView *imvaew = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cbdqx_1.png"]];
    
    [cell setSelectedBackgroundView:imvaew];
    [imvaew release];
    

    
    [cell setBackgroundColor:[UIColor clearColor]];
    
    
    
    switch (indexPath.section)
    {
        case 0:
        {
            switch (indexPath.row)
            {
                case 0:
                    cell.textLabel.text = @"首页";
                    [cell.imageView setImage:[UIImage imageNamed:@"LeftBar_Home.png"]
                     ];
                    break;                    
                case 1:
                    cell.textLabel.text = @"我";
                    [cell.imageView setImage:[UIImage imageNamed:@"LeftBar_ME.png"]];

                    break;
                case 2:
                    cell.textLabel.text = @"我的好友";
                    [cell.imageView setImage:[UIImage imageNamed:@"LeftBar_Friends"]];

                   break;
                case 3:
                    cell.textLabel.text = @"锻炼计划";
                    [cell.imageView setImage:[UIImage imageNamed:@"Nuri_Icon.png"]];
                    break;
                case 4:
                    cell.textLabel.text = @"锻炼汇";
                    [cell.imageView setImage:[UIImage
                                  imageNamed:@"Supplement_Icon.png"]];
                    break;
        
                case 5:
                    cell.textLabel.text = @"设置";
                    [cell.imageView setImage:[UIImage imageNamed:@"More_Icon.png"]];
                    break;
            }
            break;
        }
        case 1:
        {
            switch (indexPath.row)
            {
                case 0:
                    cell.textLabel.text = @"关注新浪微博";
                    [cell.imageView setImage:[UIImage imageNamed:
                                              @"Weibo_Icon.png"]];

                    break;
                
                case 1:
                    cell.textLabel.text = @"访问官方网站";
                    [cell.imageView setImage:[UIImage imageNamed:
                                              @"Aijianmei_Icon.png"]];

                    break;
            }
            break;
        }
        default:
            break;
    }
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section)
    {
        case 1:
            return @"关注爱健美";
        default:
            return nil;
    }
}

#pragma mark - UITableViewDelegate

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
        {
            return _sectionView;
        }
        case 1:
            return _sectionView;
        default:
            return nil;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
            return 15;
        case 1:
            return tableView.sectionHeaderHeight;
        default:
            return 0;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section)
    {
        case 0:
        {
            self.view.userInteractionEnabled = NO;
            switch (indexPath.row)
            {
                case 0:
                {
                    ///首页
                    [self.viewDeckController closeLeftViewBouncing:^(IIViewDeckController *controller) {
    
                        [self initHomeViewController];
                       self.viewDeckController.centerController = _navigationController;
                                            }];
                    
                    self.view.userInteractionEnabled = YES;
                    _tableView.userInteractionEnabled =YES;
                    
                      [[AnalyticsManager sharedAnalyticsManager] reportClickHomeMenu:HOME_ACTION_HOME];
                    
                }
                break;
                    
                case 1:
                {
                    ///首页
                    [self.viewDeckController closeLeftViewBouncing:^(IIViewDeckController *controller) {
                        
                        [self initMyselfController];
                        self.viewDeckController.centerController = _navigationController;
                    }];
                    
                    self.view.userInteractionEnabled = YES;
                    _tableView.userInteractionEnabled =YES;
                    
                    [[AnalyticsManager sharedAnalyticsManager] reportClickHomeMenu:HOME_ACTION_ME];

                    
                }
                    break;
                case 2:
                {
                    ///首页
                    [self.viewDeckController closeLeftViewBouncing:^(IIViewDeckController *controller) {
                        
                        [self initFriendsController];
                        self.viewDeckController.centerController = _navigationController;
                    }];
                    
                    self.view.userInteractionEnabled = YES;
                    _tableView.userInteractionEnabled =YES;
                    
                    
                    [[AnalyticsManager sharedAnalyticsManager] reportClickHomeMenu:HOME_ACTION_FRIENDS];


                    
                }
                    break;
                case 3:
                {
                    ///首页
                    [self.viewDeckController closeLeftViewBouncing:^(IIViewDeckController *controller) {
                        
                        [self initWorkoutPlanController];
                        self.viewDeckController.centerController = _navigationController;
                    }];
                    
                    self.view.userInteractionEnabled = YES;
                    _tableView.userInteractionEnabled =YES;
                    
                    [[AnalyticsManager sharedAnalyticsManager] reportClickHomeMenu:HOME_ACTION_BUY_PLANS];

                    
                }
                    break;
                case 4:
                {
                    ///首页
                    [self.viewDeckController closeLeftViewBouncing:^(IIViewDeckController *controller) {
                        
                        [self initWorkoutPlanListController];
                        self.viewDeckController.centerController = _navigationController;
                    }];
                    
                    self.view.userInteractionEnabled = YES;
                    _tableView.userInteractionEnabled =YES;
                    
                    [[AnalyticsManager sharedAnalyticsManager] reportClickHomeMenu:HOME_ACTION_PLAN_LIST];

                    
                }
                    break;
                case 5:
                {
                    [self.viewDeckController closeLeftViewBouncing:^(IIViewDeckController *controller) {
                        
                        [self initSettingsController];
                        self.viewDeckController.centerController = _navigationController;
                    }];
                    
                    self.view.userInteractionEnabled = YES;
                    _tableView.userInteractionEnabled =YES;
                    
                    [[AnalyticsManager sharedAnalyticsManager] reportClickHomeMenu:HOME_ACTION_SETTINGS];

                    
                }
                    break;


                
                default:
                    break;
            }
            break;
        }
    
    
        case 1:
        {
            /////在第二个section
            switch (indexPath.row)
            {
                case 0:
                {
                ///关注新浪微博
                
                    
                    self.view.userInteractionEnabled = YES;
                    _tableView.userInteractionEnabled =YES;
                    
                    
                    [[AnalyticsManager sharedAnalyticsManager] reportClickHomeMenu:HOME_ACTION_FOLLOW_SINA_WEIBO];

                    
                }
                break;
                case 1:
                {
                    ///关注爱健美网 www.aijianmei.com
                    //TODO
                    [self.viewDeckController closeLeftViewBouncing:^(IIViewDeckController *controller) {
                        
                        
                        [self initWebViewController];
                         self.viewDeckController.centerController = _navigationController;
                    }];
                    
                    
                    self.view.userInteractionEnabled = YES;
                    _tableView.userInteractionEnabled =YES;
                    
                    [[AnalyticsManager sharedAnalyticsManager] reportClickHomeMenu:HOME_ACTION_VIST_AIJIANMEI_COM];

                    
                    
                }
                
                   break;
                default:
                    break;
            }
            break;
        }
        default:
            break;
    }    
}



- (BOOL)shouldAutorotate

{
    
    return NO;
    
}

@end
