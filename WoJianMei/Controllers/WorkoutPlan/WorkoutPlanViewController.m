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
#define ITEM_SPACING_IPAD 368.0f



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
        self.carousel = [[iCarousel alloc]initWithFrame:CGRectMake(0,120,UIScreen.mainScreen.bounds.size.width,520)];
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
                          @"【日常锻炼】\r\r\r【日常锻炼】课程的选择,\r你将会在每周获得2个日\r常锻炼课程。课程费用为,\r 100元/年,或者30元/月。\r\r\r\r\r\r  爱健美团队提供",
                          @"【增肌增重】\r\r\r【增肌增重】课程的选择,\r你将会在每周获得3个日\r常锻炼课程。课程费用为,\r 100元/年,或者30元/月。\r\r\r\r\r\r  爱健美团队提供",
                          @"【瘦身减肥】\r\r\r【瘦身减肥】课程的选择,\r你将会在每周获得3个日\r常锻炼课程。课程费用为,\r 100元/年,或者30元/月。\r\r\r\r\r\r  爱健美团队提供",
                          @"【每日瑜伽】\r\r\r【每日瑜伽】课程的选择,\r你将会在每周获得5个日\r常锻炼课程。课程费用为,\r 100元/年,或者30元/月。\r\r\r\r\r\r  爱健美团队提供", nil];
    
    NSArray *demoArray  = [NSArray arrayWithObjects:
                           @"planImage1.png",
                           @"planImage2.png",
                           @"planImage3.png",
                           @"planImage4.png", nil];
    
    UILabel *label = nil;
    UILabel *textLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, 200, 200)];
    [textLabel setTextAlignment:NSTextAlignmentCenter];
    [textLabel setTextColor:[UIColor whiteColor]];
    [textLabel setBackgroundColor:[UIColor clearColor]];
    [textLabel setLineBreakMode:NSLineBreakByCharWrapping];
    [textLabel setNumberOfLines:0];
    [textLabel setAdjustsFontSizeToFitWidth:YES];
    [textLabel setMinimumScaleFactor:10];


	if (view == nil)
	{
        ///add images
        UIImageView *imageView =[[UIImageView alloc]init];
        //set up content
        if ([UIDevice currentDevice].userInterfaceIdiom ==UIUserInterfaceIdiomPhone){
            view = [[[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 220.0f, 160.0f+ 200)] autorelease];
            [imageView setFrame:CGRectMake(0, 0, 200.0f, 160.0f + 200)];
            
        }else{
            view = [[[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 368.0f, 520.0f)] autorelease];
            [imageView setFrame:CGRectMake(0, 0, 300.0f, 520.0f)];
            
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
    [self userBuyClassesdidSelectItemAtIndex:index];
}



-(void)carouselCurrentItemIndexUpdated:(iCarousel *)carousel{
    
    PPDebug(@"%d",[carousel currentItemIndex]);
}


-(void)userBuyClassesdidSelectItemAtIndex:(NSInteger)index{
    
    NSString *title =nil;
    switch (index) {
        case 0:
        {
            title = @"购买课程一【日常锻炼】";
        }
            break;
        case 1:
        {
            title = @"购买课程二【增肌增重】";

        }
            break;

        case 2:
        {
            title = @"购买课程三【瘦身减肥】";

        }
            break;

        case 3:
        {
            title = @"购买课程四【日常瑜伽】";

        }
            break;

            
        default:
            break;
    }
    
    UIActionSheet *sheet =[[UIActionSheet alloc]initWithTitle:title
                                                     delegate:self
                                            cancelButtonTitle:@"放弃"
                                       destructiveButtonTitle:@"苹果账号"
                                            otherButtonTitles:@"支付宝",nil];
    [sheet showInView:self.view];
    [sheet release];
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
