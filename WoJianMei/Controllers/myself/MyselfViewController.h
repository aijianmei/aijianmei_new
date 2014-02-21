//
//  MyselfViewController.h
//  WoJianMei
//
//  Created by Tom Callon  on 2/17/14.
//
//

#import "BaseViewController.h"


@class GBPathImageView;

@interface MyselfViewController : BaseViewController<UIGestureRecognizerDelegate>

{
    GBPathImageView *_avatarImageView;
}

@property(nonatomic,retain) IBOutlet GBPathImageView *avatarImageView;


@end
