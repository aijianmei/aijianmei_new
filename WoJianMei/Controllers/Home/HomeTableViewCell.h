//
//  HomeTableViewCell.h
//  WoJianMei
//
//  Created by Tom Callon  on 4/2/14.
//
//

#import <UIKit/UIKit.h>
#import "PPTableViewCell.h"

@class GBPathImageView;

@interface HomeTableViewCell : PPTableViewCell
{
   
    GBPathImageView *_avtarImageView;
    UILabel         *_descriptionLabel;
    
}

@property(nonatomic,retain) IBOutlet GBPathImageView *avtarImageView;
@property(nonatomic,retain) IBOutlet UILabel         *descriptionLabel;


+ (NSString*)getCellIdentifier;
+ (CGFloat)getCellHeight;
- (void)setCellInfo:(NSString *)article;

@end
