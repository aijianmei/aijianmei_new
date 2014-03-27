//
//  StarSessionViewController.m
//  WoJianMei
//
//  Created by Tom Callon  on 2/21/14.
//
//

#import "SessionPreviewViewController.h"
#import "PlaySessionViewController.h"


#import "AVPlayerViewController.h"
#import "MovieInfosViewController.h"




@interface SessionPreviewViewController ()
{
      NSArray *_files;
      NSArray *_networkfiles;
}

@end

@implementation SessionPreviewViewController
@synthesize playSessionButton =_playSessionButton;
@synthesize commentSessionButton =_commentSessionButton;
@synthesize shareSessionButton =_shareSessionButton;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)dealloc{
    
    [_playSessionButton release];
    [_commentSessionButton release];
    [_shareSessionButton release];
    [super dealloc];

}

- (void)reloadFiles
{
    // Local files
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [paths objectAtIndex:0];
    NSLog(@"Document path: %@", docPath);
    
    NSArray *files = [[NSFileManager defaultManager]
                      contentsOfDirectoryAtPath:docPath error:NULL];
    
    NSMutableArray *mediaFiles = [NSMutableArray array];
    for (NSString *f in files) {
        NSString *extname = [[f pathExtension] lowercaseString];
        if ([@[@"avi",@"wmv",@"rmvb",@"flv",@"f4v",@"swf",@"mkv",@"dat",@"vob",@"mts",@"ogg",@"mpg",@"wma"] indexOfObject:extname] != NSNotFound) {
            [mediaFiles addObject:[docPath stringByAppendingPathComponent:f]];
        }
    }
    _files = mediaFiles;
    
    // Network files
    _networkfiles =[[NSArray alloc]initWithObjects:
                    @"rtmp://edge01.fms.dutchview.nl/botr/bunny.flv",
                    @"http://v.youku.com/player/getRealM3U8/vid/XNDY2ODM2NTg0/type/mp4",
                    @"http://hot.vrs.sohu.com/ipad1407291_4596271359934_4618512.m3u8",
                    @"rtmp://edge01.fms.dutchview.nl/botr/bunny.flv",
                    @"http://v.youku.com/player/getRealM3U8/vid/XNDY2ODM2NTg0/type/mp4",
                    @"http://hot.vrs.sohu.com/ipad1407291_4596271359934_4618512.m3u8",
                    nil];

}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self reloadFiles];

    [self initButtons];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setTitle:@"锻炼预览"];
    
    self.dataList = [NSArray arrayWithObjects:
                     @"posture1",
                     @"posture2",
                     @"posture3",
                     @"posture4",
                     @"posture5",
                     @"posture1",
                     @"posture2",
                     @"posture3",
                     @"posture4",
                     @"posture5",
                     nil];
    
    
    
    
}


#pragma mark --
#pragma mark - Set the Button
-(void)initButtons{
    
    [self.playSessionButton addTarget:self action:@selector(clickPlaySessionButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.commentSessionButton addTarget:self action:@selector(clickCommentSessionButton:) forControlEvents:UIControlEventTouchUpInside];

    
    [self.shareSessionButton addTarget:self action:@selector(clickShareSessionButton:) forControlEvents:UIControlEventTouchUpInside];

}

#pragma mark --
#pragma mark - ClickButtons Methods 

-(void)clickPlaySessionButton:(id)sender{
   
    PlaySessionViewController *vc  =[[PlaySessionViewController alloc]initWithNibName:@"PlaySessionViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
    [vc release];
    
}

-(void)clickCommentSessionButton:(id)sender{
    PPDebug(@"clickCommentSessionButton");

    
}

-(void)clickShareSessionButton:(id)sender{
    PPDebug(@"clickShareSessionButton");

    
}



#pragma mark --
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    
//    switch (section) {
//        case 0:
//            return _networkfiles.count;
//        case 1:
//            return [_files count];
//        default:
//            return 0;
//    }

    return [self.dataList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [dataTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        
    }
    
    
    NSArray *arra =[NSArray arrayWithObjects:
                    @"腿部锻炼",
                    @"腹部锻炼",
                    @"胸肌锻炼",
                    @"重复锻炼",
                    @"肩部锻炼",
                    @"跑步锻炼",
                    @"肩部重复锻炼",
                    @"手臂重复锻炼",
                    @"瑜伽重复锻炼",
                    @"手臂重复锻炼",

                    nil];
    
    // Configure the cell...
    [cell.textLabel setText:[NSString stringWithFormat:@"%@",[arra objectAtIndex:indexPath.row]]];
    
    
    //Text color
    [cell.textLabel setTextColor:[UIColor grayColor]];
    [cell.imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[self.dataList objectAtIndex:indexPath.row]]]];
    
    return cell;
}


#pragma mark --
#pragma mark - heightForRowAtIndexPath

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 40;
}


#pragma mark --
#pragma mark - DidSelectRowAtIndexPath
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    AVPlayerViewController *playerController =  [[AVPlayerViewController alloc]initWithNibName:@"AVPlayerViewController" bundle:nil];
    
    switch (indexPath.section) {
        case 0:
        {
            playerController.mediaPath = [_networkfiles objectAtIndex:indexPath.row];
            

        }
            break;
        case 1:
            playerController.mediaPath = [_files objectAtIndex:indexPath.row];
            break;
    }

    
    [self.navigationController presentViewController:playerController animated:YES completion:NULL];
    
   
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
