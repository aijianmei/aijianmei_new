//
//  AppDelegate.h
//  ASDFASF
//
//  Created by Tom Callon  on 2/17/14.
//  Copyright (c) 2014 Tom Callon . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPApplication.h"
#import "ReviewRequest.h"
#import "WXApi.h"



@class AJMViewDelegate;
@class HomeViewController;
@class IIViewDeckController;
@class NetworkDetector;
@class ICETutorialController;

@interface AppDelegate : PPApplication <UIApplicationDelegate,ReviewRequestDelegate,WXApiDelegate>
{
    AJMViewDelegate *_viewDelegate;
    
    ICETutorialController *_iceTutorialController;

}
@property (strong, nonatomic)  UIWindow *window;
@property (nonatomic,retain)   UINavigationController *navigationController;
@property (nonatomic,retain)   HomeViewController *homeViewController;
@property (nonatomic,readonly) AJMViewDelegate *viewDelegate;
@property (nonatomic, retain)  IIViewDeckController *viewController;
@property (nonatomic, retain)  ReviewRequest *reviewRequest;
@property (nonatomic, retain)  NetworkDetector *networkDetector;
@property (nonatomic, retain) ICETutorialController *iceTutorialController;






+ (AppDelegate*)getAppDelegate;
-(void)dismissWelcomeage;
-(HomeViewController *)initHomeViewControllerFromAppDelegate;



@end
