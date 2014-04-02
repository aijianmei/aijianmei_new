//
//  HomeTableViewCell.m
//  WoJianMei
//
//  Created by Tom Callon  on 4/2/14.
//
//

#import "HomeTableViewCell.h"
#import "GBPathImageView.h"

#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)


@implementation HomeTableViewCell

@synthesize avtarImageView =_avtarImageView;
@synthesize descriptionLabel= _descriptionLabel;


-(void)dealloc{
    [_descriptionLabel release];
    [_avtarImageView release];
    [super dealloc];
}

- (void)setCellStyle
{
    self.selectionStyle = UITableViewCellSelectionStyleGray;
}

- (void)awakeFromNib{
    // Initialization code
    [self setCellStyle];
}

+ (NSString*)getCellIdentifier
{
    
    if (isPad) {
        return  @"HomeTableViewCell ~ipad";
    }
    return @"HomeTableViewCell";
}

+ (HomeTableViewCell*) createCell:(id)delegate
{
    NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"HomeTableViewCell" owner:self options:nil];
    
    if (isPad) {
        topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"HomeTableViewCell ~ipad" owner:self options:nil];
    }

    // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
    if (topLevelObjects == nil || [topLevelObjects count] <= 0){
        NSLog(@"create <HomeTableViewCell> but cannot find cell object from Nib");
        return nil;
    }
    
    ((HomeTableViewCell*)[topLevelObjects objectAtIndex:0]).delegate = delegate;
    return (HomeTableViewCell*)[topLevelObjects objectAtIndex:0];
    
}

+ (CGFloat)getCellHeight
{
    
    if (isPad) {
        return 157.0f;
    }
    return 147.0f;
}

- (void)setCellInfo:(NSString *)article
{
    //set articles cells
    self.avtarImageView = [[GBPathImageView alloc]initWithFrame:CGRectMake(0, 0, 60, 60) image:[UIImage imageNamed:@"tomcallon.png"] pathType:GBPathImageViewTypeCircle pathColor:[UIColor greenColor] borderColor:[UIColor redColor] pathWidth:1.5];
    [self.descriptionLabel setText:article];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
