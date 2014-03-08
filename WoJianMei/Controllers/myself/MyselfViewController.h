//
//  MyselfViewController.h
//  WoJianMei
//
//  Created by Tom Callon  on 2/17/14.
//
//

#import "MyselfBaseViewController.h"
#import "PPTableViewController.h"


@class GBPathImageView;

@interface MyselfViewController : MyselfBaseViewController<UIGestureRecognizerDelegate>

{
    GBPathImageView *_avatarImageView;
    
}

@property(nonatomic,retain) IBOutlet GBPathImageView *avatarImageView;


@end
