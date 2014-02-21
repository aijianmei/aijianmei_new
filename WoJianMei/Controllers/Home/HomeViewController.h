//
//  HomeViewController.h
//  WoJianMei
//
//  Created by Tom Callon  on 2/17/14.
//
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"


@interface HomeViewController : BaseViewController<UIGestureRecognizerDelegate>

{
    UIView *_headerView ;

}
@property (nonatomic, retain) UIView *headerView;


@end
