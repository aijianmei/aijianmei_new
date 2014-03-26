//
//  WorkoutPlanViewController.m
//  WoJianMei
//
//  Created by Tom Callon  on 2/17/14.
//
//

#import "WorkoutPlanViewController.h"
#import "iCarousel.h"
#import "UIImageView+WebCache.h"



@interface WorkoutPlanViewController ()

@end

@implementation WorkoutPlanViewController


///// the setings of the iCarousel
#define NUMBER_OF_ITEMS 4
#define NUMBER_OF_VISIBLE_ITEMS 18
#define ITEM_SPACING 220
#define ITEM_SPACING_IPAD 768.0f


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
    
    [self setTitle:@"锻炼计划"];
    
}

#pragma mark --
#pragma mark iCarousel methods
- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return NUMBER_OF_ITEMS;
    //    return [self.dataList count];
}

- (NSUInteger)numberOfVisibleItemsInCarousel:(iCarousel *)carousel
{
    //if you have less than around 30 items in the carousel
    //you'll get better performance if NUMBER_OF_VISIBLE_ITEMS >= NUMBER_OF_ITEMS
    //because then the item view reflections won't have to be re-generated as
    //the carousel is scrolling
    return NUMBER_OF_VISIBLE_ITEMS;
}

- (UIView *)carousel:(iCarousel *)carousel
  viewForItemAtIndex:(NSUInteger)index
         reusingView:(UIView *)view
{
	//create new view if no view is available for recycling
    UILabel *label = nil;
    
    NSArray *demoArray  = [NSArray arrayWithObjects:
                           @"http://192.168.1.106/~tomcallon/planImage1.jpg",
                           @"http://192.168.1.106/~tomcallon/planImage2.jpg",
                           @"http://192.168.1.106/~tomcallon/planImage3.jpg",
                           @"http://192.168.1.106/~tomcallon/planImage4.jpg", nil];
    
    
	if (view == nil)
	{
        ///add images
        UIImageView *imageView =[[UIImageView alloc]init];
        //set up content
        if ([UIDevice currentDevice].userInterfaceIdiom ==UIUserInterfaceIdiomPhone){
            view = [[[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 220.0f, 160.0f+ 200)] autorelease];
            //            [view setBackgroundColor:[UIColor redColor]];
            [imageView setFrame:CGRectMake(0, 0, 190.0f, 160.0f + 200)];
            
        }else{
            view = [[[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 768.0f, 320.0f)] autorelease];
            [imageView setFrame:CGRectMake(0, 0, 768.0f, 320.0f)];
            
        }
        
        [imageView setImageWithURL:[NSURL URLWithString:[demoArray objectAtIndex:index]] placeholderImage:nil success:^(UIImage *image, BOOL cached) {
            //TODO
        } failure:^(NSError *error) {
            //TODO
        }];
        
        
        [view addSubview:imageView];
        [imageView release];
        
	}
	else
	{
		label = [[view subviews] lastObject];
	}
	
    //set label
	label.text = [NSString stringWithFormat:@"%d",index];
    
	return view;
    
}

- (CGFloat)carouselItemWidth:(iCarousel *)carousel
{
    if ([UIDevice currentDevice].userInterfaceIdiom ==UIUserInterfaceIdiomPhone){
        return ITEM_SPACING;
    }else  {
        return ITEM_SPACING_IPAD;
    }
    return ITEM_SPACING_IPAD;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    PPDebug(@"I did selected the picture of %d",index);
    
    
}

-(void)carouselCurrentItemIndexUpdated:(iCarousel *)carousel{
    
    PPDebug(@"%d",[carousel currentItemIndex]);
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
