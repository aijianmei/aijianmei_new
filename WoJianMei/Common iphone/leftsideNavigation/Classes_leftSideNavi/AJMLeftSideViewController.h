//
//  AGLeftSideViewController.h
//  AGShareSDKDemo
//
//  Created by 冯 鸿杰 on 13-1-30.
//  Copyright (c) 2013年 vimfung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGSectionView.h"
#import "SinaWeiboRequest.h"
#import "PPViewController.h"


@class HomeViewController;
@class MyselfViewController;
@class FriendsViewController;
@class WorkoutListViewController;
@class WorkoutPlanViewController;
@class SettingsViewController;
@class SVWebViewController;

@interface AJMLeftSideViewController : PPViewController <UITableViewDataSource,
                                                        UITableViewDelegate,UIAlertViewDelegate>
{
@private
    UITableView *_tableView;
    AGSectionView *_sectionView;
    
    HomeViewController            *_homeViewController;
    MyselfViewController          *_myselfViewController;
    SVWebViewController           *_webViewController;
}

@property(nonatomic, retain) UINavigationController   *navigationController;

@property(nonatomic, retain) HomeViewController      *homeViewController;
@property(nonatomic, retain) MyselfViewController    *myselfViewController;
@property(nonatomic, retain) FriendsViewController   *friendsViewController;

@property(nonatomic, retain) SettingsViewController   *settingsViewController;
@property(nonatomic, retain) WorkoutPlanViewController  *workoutPlanViewController;
@property(nonatomic, retain) WorkoutListViewController  *workoutListViewController;

@property (nonatomic,retain) SVWebViewController     *webViewController;



@end
