//
//  AppDelegate.m
//  ASDFASF
//
//  Created by Tom Callon  on 2/17/14.
//  Copyright (c) 2014 Tom Callon . All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "AJMViewDelegate.h"
#import "AJMLeftSideViewController.h"
#import "IIViewDeckController.h"
#import "HJObjManager.h"


//以备以后开发不同的app用
#import "GameApp.h"
#import "GameAppProtocol.h"

#import "MobClick.h"  //友盟统计


//SNS Service
#import "PPSNSIntegerationService.h"
#import "PPSinaWeiboService.h"
#import "PPTecentWeiboService.h"
#import "PPFacebookService.h"


#import "ICETutorialController.h"


//ConfigureManager
#import "ConfigManager.h"



#import "DeviceDetection.h"

#import "NetworkDetector.h"

//支付管理
//#import "AliPayManager.h"


#import "LoginViewController.h"
#import "SignUpViewController.h"








@implementation AppDelegate
@synthesize window = _window;
@synthesize navigationController =_navigationController;
@synthesize viewDelegate = _viewDelegate;
@synthesize reviewRequest =_reviewRequest;
@synthesize networkDetector = _networkDetector;
@synthesize iceTutorialController =_iceTutorialController;




- (id)init{
    if(self = [super init]){
        _viewDelegate = [[AJMViewDelegate alloc] init];
    }
    
    return self;
    
}
- (void)dealloc
{
    PPRelease(_reviewRequest);
    PPRelease(_window);
    PPRelease(_homeViewController);
    PPRelease(_viewController);
    PPRelease(_networkDetector);
    PPRelease(_iceTutorialController);
    [super dealloc];
}


+(AppDelegate*)getAppDelegate
{
    return (AppDelegate*)[UIApplication sharedApplication].delegate;
}

-(void)initICETutorialController{
    
    // Init the pages texts, and pictures.
    ICETutorialPage *layer1 = [[ICETutorialPage alloc] initWithSubTitle:@"Picture 1"
                                                            description:@"Champs-Elysées by night"
                                                            pictureName:@"tutorial_background_00@2x.jpg"];
    ICETutorialPage *layer2 = [[ICETutorialPage alloc] initWithSubTitle:@"Picture 2"
                                                            description:@"The Eiffel Tower with\n cloudy weather"
                                                            pictureName:@"tutorial_background_01@2x.jpg"];
    ICETutorialPage *layer3 = [[ICETutorialPage alloc] initWithSubTitle:@"Picture 3"
                                                            description:@"An other famous street of Paris"
                                                            pictureName:@"tutorial_background_02@2x.jpg"];
    ICETutorialPage *layer4 = [[ICETutorialPage alloc] initWithSubTitle:@"Picture 4"
                                                            description:@"The Eiffel Tower with a better weather"
                                                            pictureName:@"tutorial_background_03@2x.jpg"];
    ICETutorialPage *layer5 = [[ICETutorialPage alloc] initWithSubTitle:@"Picture 5"
                                                            description:@"The Louvre's Museum Pyramide"
                                                            pictureName:@"tutorial_background_04@2x.jpg"];
    
    // Set the common style for SubTitles and Description (can be overrided on each page).
    ICETutorialLabelStyle *subStyle = [[ICETutorialLabelStyle alloc] init];
    [subStyle setFont:TUTORIAL_SUB_TITLE_FONT];
    [subStyle setTextColor:TUTORIAL_LABEL_TEXT_COLOR];
    [subStyle setLinesNumber:TUTORIAL_SUB_TITLE_LINES_NUMBER];
    [subStyle setOffset:TUTORIAL_SUB_TITLE_OFFSET];
    
    ICETutorialLabelStyle *descStyle = [[ICETutorialLabelStyle alloc] init];
    [descStyle setFont:TUTORIAL_DESC_FONT];
    [descStyle setTextColor:TUTORIAL_LABEL_TEXT_COLOR];
    [descStyle setLinesNumber:TUTORIAL_DESC_LINES_NUMBER];
    [descStyle setOffset:TUTORIAL_DESC_OFFSET];
    
    // Load into an array.
    NSArray *tutorialLayers = @[layer1,layer2,layer3,layer4,layer5];
    
    // Override point for customization after application launch.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self.iceTutorialController = [[ICETutorialController alloc] initWithNibName:@"ICETutorialController_iPhone"
                                                                      bundle:nil
                                                                    andPages:tutorialLayers];
    } else {
        self.iceTutorialController = [[ICETutorialController alloc] initWithNibName:@"ICETutorialController_iPad"
                                                                      bundle:nil
                                                                    andPages:tutorialLayers];
    }
    
    // Set the common styles, and start scrolling (auto scroll, and looping enabled by default)
    [self.iceTutorialController setCommonPageSubTitleStyle:subStyle];
    [self.iceTutorialController setCommonPageDescriptionStyle:descStyle];
    
    // Set button 1 action.
    [self.iceTutorialController setButton1Block:^(UIButton *button){
        NSLog(@"Button 1 pressed.");
        
        
        if (ISIPAD) {
            SignUpViewController *vc =[[SignUpViewController alloc]initWithNibName:@"SignUpViewController~ipad" bundle:nil];
            [self.navigationController.visibleViewController presentViewController:vc
                                                                          animated:YES
                                                                        completion:NULL];

            
        }else{
            SignUpViewController *vc =[[SignUpViewController alloc]initWithNibName:@"SignUpViewController" bundle:nil];
            [self.navigationController.visibleViewController presentViewController:vc
                                                                          animated:YES
                                                                        completion:NULL];

        }
        
        
        
    }];
    
    // Set button 2 action, stop the scrolling.
    __unsafe_unretained typeof(self) weakSelf = self;
    [self.iceTutorialController setButton2Block:^(UIButton *button){
        
        if (ISIPAD) {
            LoginViewController *vc =[[LoginViewController alloc]initWithNibName:@"LoginViewController~ipad" bundle:nil];
            [self.navigationController.visibleViewController presentViewController:vc
                                                                          animated:YES
                                                                        completion:NULL];

        }else{
            
            LoginViewController *vc =[[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
            [self.navigationController.visibleViewController presentViewController:vc
                                                                          animated:YES
                                                                        completion:NULL];

        
        }
        

        NSLog(@"Button 2 pressed.");
        NSLog(@"Auto-scrolling stopped.");
        [weakSelf.iceTutorialController stopScrolling];
    }];
    
    // Run it.
    [self.iceTutorialController startScrolling];
}


-(void)showWelcomeage{
    [self.navigationController presentViewController: self. iceTutorialController animated:YES completion:NULL];
}

-(void)dismissWelcomeage{
    [self.navigationController dismissViewControllerAnimated:YES completion:NULL];
}


-(HomeViewController *)initHomeViewControllerFromAppDelegate{
    
    if (self.homeViewController == nil) {
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            HomeViewController *vc=[[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
            self.homeViewController =vc;
            [vc release];
        }
        else
        {
            HomeViewController *vc =[[HomeViewController alloc] initWithNibName:@"HomeViewController ~ipad" bundle:nil];
            self.homeViewController =vc;
            [vc release];
        }
        
    }
    
    
    
    self.homeViewController.title = @"首页";
    return  self.homeViewController;
    
}


- (void)initSNSService
{
    PPSinaWeiboService* sinaWeiboService = [[[PPSinaWeiboService alloc] initWithAppKey:[GameApp sinaAppKey]
                                                                             appSecret:[GameApp sinaAppSecret]
                                                                        appRedirectURI:[GameApp sinaAppRedirectURI]
                                                                       officialWeiboId:[GameApp sinaWeiboId]] autorelease];
    PPTecentWeiboService* qqWeiboService = [[[PPTecentWeiboService alloc] initWithAppKey:[GameApp qqAppKey]
                                                                               appSecret:[GameApp qqAppSecret]
                                                                          appRedirectURI:[GameApp qqAppRedirectURI]
                                                                         officialWeiboId:[GameApp qqWeiboId]] autorelease];
    PPFacebookService* facebookService = [[[PPFacebookService alloc] initWithAppKey:[GameApp facebookAppKey]
                                                                          appSecret:[GameApp facebookAppSecret]
                                                                     appRedirectURI:nil
                                                                    officialWeiboId:[UIUtils getAppName]] autorelease];
    
    [[PPSNSIntegerationService defaultService] addSNS:sinaWeiboService];
    [[PPSNSIntegerationService defaultService] addSNS:qqWeiboService];
    [[PPSNSIntegerationService defaultService] addSNS:facebookService];
}






- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    
#ifdef DEBUG
    [MobClick setLogEnabled:YES];
#endif

    
    // init mob click
    [MobClick startWithAppkey:UMENG_APPKEY
                 reportPolicy:BATCH
                    channelId:@"234567"];
    
    [MobClick updateOnlineConfig];

    
    
    ///初始化
    [self initImageCacheManager];

    
    
    
    if ([GameApp supportWeixin] == YES){
        PPDebug(@"Init Weixin SDK");
        [WXApi registerApp:WECHAT_APPKEY];
    }
    
    
    
    // Push  Notifications  Setup
    BOOL isAskBindDevice = NO;
    if (![self isPushNotificationEnable]){
        isAskBindDevice = YES;
        [self bindDevice];
    }

    
    
    // Ask For Review
    if ([ConfigManager isInReviewVersion] == NO){
        if ([DeviceDetection isOS5]){
            self.reviewRequest = [ReviewRequest startReviewRequest:[ConfigManager appId] appName:GlobalGetAppName() isTest:YES];
            self.reviewRequest.delegate = self;
        }
    }

    

    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    
    
    HomeViewController *homeViewVC =[self initHomeViewControllerFromAppDelegate];
    self.navigationController = [[UINavigationController alloc]initWithRootViewController:homeViewVC];
    
    
    //添加left View 导航栏
    AJMLeftSideViewController *leftVC = [[[AJMLeftSideViewController alloc] init] autorelease];
    IIViewDeckController *vc = [[IIViewDeckController alloc] initWithCenterViewController:self.navigationController leftViewController:leftVC];
    
    if ([UIDevice currentDevice].userInterfaceIdiom ==UIUserInterfaceIdiomPhone){
        vc.leftSize  = self.window.frame.size.width - (self.window.frame.size.width - 80.0f);
        
    }else{
        vc.leftSize  = self.window.frame.size.width  - 100.0f;
    }
    
    
    self.viewController = vc;
    
    
    //设置全局顶部导航全局变量的颜色
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
 	[[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:66.0/255.0 green:155.0/255.0 blue:255.0/255.0 alpha:1.0]];

    
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

    
   


    
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    //展示页面
    [self initICETutorialController];
    
    //展示一下，展示页面；
    [self showWelcomeage];


    
    
    // Init SNS service
    [self initSNSService];
    
    
    // Detect Network Availability
    self.networkDetector = [[[NetworkDetector alloc] initWithErrorTitle:NSLS(@"kNetworkErrorTitle") ErrorMsg:NSLS(@"kNetworkErrorMessage") detectInterval:2] autorelease];
    [self.networkDetector start];
    
    
    
    //Check Version
    [UIUtils checkAppVersion];

    
    return YES;
}


- (void)reviewDone
{
    [self setReviewRequest:nil];
}

							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    
    // update when enter background
    [MobClick updateOnlineConfig];
    
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    
    PPDebug(@"<applicationWillEnterForeground>");

}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    PPDebug(@"<applicationDidBecomeActive>");
    [self.networkDetector start];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark - HandleURL Method
- (BOOL)handleURL:(NSURL*)url
{
    PPDebug(@"<handleURL> url=%@", url.absoluteString);
    
    if ([[url absoluteString] hasPrefix:@"wx"]){
        return [WXApi handleOpenURL:url delegate:self];;
    }else if ([[url absoluteString] hasPrefix:@"alipay"]){
        
//        return [AliPayManager parseURL:url alipayPublicKey:[ConfigManager getAlipayAlipayPublicKey]];
        
        return YES;
    }
    else if ([[PPSNSIntegerationService defaultService] handleOpenURL:url]){
        
    }
    
    return YES;
}


- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return [self handleURL:url];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [self handleURL:url];
}





#pragma mark - Alert View Delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == CHECK_APP_VERSION_ALERT_VIEW){
        if (buttonIndex == 1){
            [UIUtils openAppForUpgrade:[ConfigManager appId]];
        }
    }
}


#pragma mark - Wechat Delegate
-(void) onReq:(BaseReq*)req
{
//    if (self.homeController && [self.homeController conformsToProtocol:@protocol(DrawHomeControllerProtocol)]) {
//        if ([self.homeController isRegistered]) {
//            [self.homeController toRegister];
//        } else {
//            [ShareController shareFromWeiXin:self.homeController];
//        }
//    }
    
}

-(void) onResp:(BaseResp*)resp
{
    if([resp isKindOfClass:[SendMessageToWXResp class]])
    {
        if (resp.errCode == WXSuccess){
            [UIUtils alert:@"已成功分享至微信"];
            PPDebug(@"<onResp> weixin response success");
        }else {
            PPDebug(@"<onResp> weixin response fail");
        }
    }
}

@end
