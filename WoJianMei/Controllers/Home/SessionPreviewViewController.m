//
//  StarSessionViewController.m
//  WoJianMei
//
//  Created by Tom Callon  on 2/21/14.
//
//

#import "SessionPreviewViewController.h"
#import "PlaySessionViewController.h"


@interface SessionPreviewViewController ()

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


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initButtons];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setTitle:@"锻炼预览"];
    
    self.dataList = [NSArray arrayWithObjects:
                     @"我今天锻炼了七个动作，感觉我自己身体好了很多哦！",
                     @"我刚刚和小强成为了好朋友哦。!!!",
                     @"我现在要前往健身房去健身了!!!",
                     @"小明，今天锻炼了他的腿部，你要一起吗？",
                     @"欢迎来到爱健美，和我们的健身专家一起去健身哦！",
                     @"我今天锻炼了七个动作，感觉我自己身体好了很多哦！",
                     @"我刚刚和小强成为了好朋友哦。!!!",
                     @"我现在要前往健身房去健身了!!!",
                     @"小明，今天锻炼了他的腿部，你要一起吗？",
                     @"欢迎来到爱健美，和我们的健身专家一起去健身哦！",nil];
    
    
    
    
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
    PPDebug(@"clickPlaySessionButton");
    PlaySessionViewController *vc = [[PlaySessionViewController alloc]initWithNibName:@"PlaySessionViewController" bundle:nil];
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
    return [self.dataList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [dataTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        
    }
    
    
    // Configure the cell...
    [cell.textLabel setText:[NSString stringWithFormat:@"%@",[self.dataList objectAtIndex:indexPath.row]]];
    
    
    //Text color
    [cell.textLabel setTextColor:[UIColor grayColor]];
    [cell.imageView setImage:[UIImage imageNamed:@"tomcallon.png"]];
    
    
    
    
    
    
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
    
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
