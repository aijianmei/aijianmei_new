//
//  PlaySessionViewController.m
//  WoJianMei
//
//  Created by Tom Callon  on 2/21/14.
//
//

#import "PlaySessionViewController.h"
#import "ALMoviePlayerController.h"

@interface PlaySessionViewController () <ALMoviePlayerControllerDelegate>

@property (nonatomic, strong) ALMoviePlayerController *moviePlayer;
@property (nonatomic) CGRect defaultFrame;

@end

@implementation PlaySessionViewController

- (id)init {
    self = [super init];
    if (self) {
        self.title = NSLocalizedString(@"ALMoviePlayerController", @"ALMoviePlayerController");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    

    
    
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setTitle:@"锻炼"];

    self.view.backgroundColor = [UIColor darkGrayColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Local File" style:UIBarButtonItemStyleBordered target:self action:@selector(localFile)];
    self.navigationItem.leftBarButtonItem.enabled = NO;
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Remote File" style:UIBarButtonItemStyleBordered target:self action:@selector(remoteFile)];
    self.navigationItem.rightBarButtonItem.enabled = NO;
    
    //create a player
    self.moviePlayer = [[ALMoviePlayerController alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    
    self.moviePlayer.view.alpha = 0.f;
    self.moviePlayer.delegate = self; //IMPORTANT!
    
    //create the controls
    ALMoviePlayerControls *movieControls = [[ALMoviePlayerControls alloc] initWithMoviePlayer:self.moviePlayer style:ALMoviePlayerControlsStyleDefault];
    //[movieControls setAdjustsFullscreenImage:NO];
    [movieControls setBarColor:[UIColor colorWithRed:64/255.0 green:203/255.0 blue:255/255.0 alpha:0.5]];
    [movieControls setTimeRemainingDecrements:YES];
    //[movieControls setFadeDelay:2.0];
    //[movieControls setBarHeight:100.f];
    //[movieControls setSeekRate:2.f];
    
    //assign controls
    [self.moviePlayer setControls:movieControls];
    [self.view addSubview:self.moviePlayer.view];
    
  /*
   By tomcallon
    //THEN set contentURL
    [self.moviePlayer setContentURL:[NSURL URLWithString:@"http://archive.org/download/WaltDisneyCartoons-MickeyMouseMinnieMouseDonaldDuckGoofyAndPluto/WaltDisneyCartoons-MickeyMouseMinnieMouseDonaldDuckGoofyAndPluto-HawaiianHoliday1937-Video.mp4"]];
    
    */
    
    
    [self.moviePlayer setContentURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"video1" ofType:@"mov"]]];
    
    
    
    //delay initial load so statusBarOrientation returns correct value
    double delayInSeconds = 0.3;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        
        
        [self configureViewForOrientation:[UIApplication sharedApplication].statusBarOrientation];
        [UIView animateWithDuration:0.3 delay:0.0 options:0 animations:^{
            self.moviePlayer.view.alpha = 1.f;
        } completion:^(BOOL finished) {
            self.navigationItem.leftBarButtonItem.enabled = YES;
            self.navigationItem.rightBarButtonItem.enabled = YES;
        }];
    });
    
}

- (void)configureViewForOrientation:(UIInterfaceOrientation)orientation {
    CGFloat videoWidth = 0;
    CGFloat videoHeight = 0;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
//        videoWidth = 700.f;
//        videoHeight = 535.f;
        
        videoWidth = self.view.frame.size.width;
        videoHeight = self.view.frame.size.height;;

        
    } else {
        videoWidth = self.view.frame.size.width;
        videoHeight = 220.f;
//        videoHeight = self.view.frame.size.height;

    }
    
    //calulate the frame on every rotation, so when we're returning from fullscreen mode we'll know where to position the movie plauyer
    self.defaultFrame = CGRectMake(self.view.frame.size.width/2 - videoWidth/2, self.view.frame.size.height/2 - videoHeight/2, videoWidth, videoHeight);
    
    //only manage the movie player frame when it's not in fullscreen. when in fullscreen, the frame is automatically managed
    if (self.moviePlayer.isFullscreen)
        return;
    
    //you MUST use [ALMoviePlayerController setFrame:] to adjust frame, NOT [ALMoviePlayerController.view setFrame:]
    [self.moviePlayer setFrame:self.defaultFrame];
}

//these files are in the public domain and no longer have property rights
- (void)localFile {
    [self.moviePlayer stop];
    [self.moviePlayer setContentURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"video1" ofType:@"mov"]]];
    [self.moviePlayer play];
    [self.moviePlayer setFullscreen:YES animated:YES];
}

- (void)remoteFile {
    [self.moviePlayer stop];
    [self.moviePlayer setContentURL:[NSURL URLWithString:@"http://archive.org/download/WaltDisneyCartoons-MickeyMouseMinnieMouseDonaldDuckGoofyAndPluto/WaltDisneyCartoons-MickeyMouseMinnieMouseDonaldDuckGoofyAndPluto-HawaiianHoliday1937-Video.mp4"]];
    [self.moviePlayer play];
}

//IMPORTANT!
- (void)moviePlayerWillMoveFromWindow {
    //movie player must be readded to this view upon exiting fullscreen mode.
    if (![self.view.subviews containsObject:self.moviePlayer.view])
        [self.view addSubview:self.moviePlayer.view];
    
    //you MUST use [ALMoviePlayerController setFrame:] to adjust frame, NOT [ALMoviePlayerController.view setFrame:]
    [self.moviePlayer setFrame:self.defaultFrame];
}

- (void)movieTimedOut {
    NSLog(@"MOVIE TIMED OUT");
}




-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [super willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
    [self configureViewForOrientation:toInterfaceOrientation];
}


-(void)viewDidDisappear:(BOOL)animated{
    
    [super viewDidDisappear:animated];
    [self.moviePlayer stop];
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
