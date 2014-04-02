//
//  WorkoutPlanViewController.h
//  WoJianMei
//
//  Created by Tom Callon  on 2/17/14.
//
//

#import "BaseViewController.h"
#import "iCarousel.h"


@interface WorkoutPlanViewController : BaseViewController<iCarouselDataSource,iCarouselDelegate,UIActionSheetDelegate>

{
    iCarousel                   *_carousel;
    int iid;

    
    
}
@property (nonatomic, retain) iCarousel *carousel;


@end
