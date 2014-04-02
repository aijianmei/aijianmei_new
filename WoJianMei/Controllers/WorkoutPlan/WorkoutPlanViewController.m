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



-(void)dealloc{
    [_carousel release];
    [super dealloc];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setTitle:@"锻炼计划"];
    [self addCarouselSliders];
}



#pragma mark-- 
#pragma mark-- addCarouselSliders Method
-(void)addCarouselSliders{
    //configure carousel
    if ([UIDevice currentDevice].userInterfaceIdiom ==UIUserInterfaceIdiomPhone){
        self.carousel = [[iCarousel alloc]initWithFrame:CGRectMake(0,120,UIScreen.mainScreen.bounds.size.width ,160 + 200)];
        
    }
    else{
        self.carousel = [[iCarousel alloc]initWithFrame:CGRectMake(0,120,UIScreen.mainScreen.bounds.size.width,320)];
    }
    
    
    self.carousel.delegate = self;
    self.carousel.dataSource = self;
    self.carousel.type = iCarouselTypeLinear;
    [self.carousel setScrollEnabled:YES];
    
    //边界的bounce
    [self.carousel setBounces:NO];
    
    
    
    //可以调整slider 的滑动速度;
    [self.carousel setScrollSpeed:0.75f];
    
    [self.view addSubview:self.carousel];
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
    NSArray *textArray = [NSArray arrayWithObjects:
                          @"日常锻炼",
                          @"增肌增重",
                          @"瘦身减肥",
                          @"每日瑜伽", nil];
    
    NSArray *demoArray  = [NSArray arrayWithObjects:
                           @"planImage1.png",
                           @"planImage2.png",
                           @"planImage3.png",
                           @"planImage4.png", nil];
    
    UILabel *label = nil;
    UILabel *textLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, 320, 100)];

	if (view == nil)
	{
        ///add images
        UIImageView *imageView =[[UIImageView alloc]init];
        //set up content
        if ([UIDevice currentDevice].userInterfaceIdiom ==UIUserInterfaceIdiomPhone){
            view = [[[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 220.0f, 160.0f+ 200)] autorelease];
            [imageView setFrame:CGRectMake(0, 0, 190.0f, 160.0f + 200)];
            
        }else{
            view = [[[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 768.0f, 320.0f)] autorelease];
            [imageView setFrame:CGRectMake(0, 0, 768.0f, 320.0f)];
            
        }
        
        [imageView  setImage:[ UIImage imageNamed:[demoArray objectAtIndex:index]]];
        [textLabel setText:[textArray objectAtIndex:index]];

        [view addSubview:imageView];
        [view addSubview:textLabel];

        [imageView release];
        [textLabel release];
        
	}
	else
	{
		label = [[view subviews] lastObject];
	}
	
    //set label
	label.text = [NSString stringWithFormat:@"%d",index];
    
    
    
    [view addSubview:label];
    
    
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
