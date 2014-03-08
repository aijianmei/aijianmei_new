//
//  SettingsViewController.h
//  WoJianMei
//
//  Created by Tom Callon  on 2/17/14.
//
//

#import "BaseViewController.h"
#import "SettingsBaseViewController.h"
#import "UMFeedback.h"

@interface SettingsViewController : SettingsBaseViewController<UMFeedbackDataDelegate>

{
    UMFeedback *_umFeedback;

    UIButton *_buttonFeedBack;
    UIButton *_buttonContactUs;

}
@property(nonatomic, retain) UMFeedback *umFeedback;

@property (nonatomic,retain) IBOutlet UIButton *buttonFeedBack;
@property (nonatomic,retain) IBOutlet UIButton *buttonContactUs;


@end
