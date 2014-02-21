//
//  AnalyticsManager.h
//  Draw
//
//  Created by qqn_pipi on 12-12-29.
//
//

#import <Foundation/Foundation.h>

#define HOME_CLICK                          @"HOME_CLICK"

//前六个按钮
#define HOME_ACTION_HOME                    @"HOME_ACTION_HOME"
#define HOME_ACTION_ME                      @"HOME_ACTION_ME"
#define HOME_ACTION_FRIENDS                 @"HOME_ACTION_FRIENDS"
#define HOME_ACTION_BUY_PLANS               @"HOME_ACTION_BUY_PLANS"
#define HOME_ACTION_PLAN_LIST               @"HOME_ACTION_PLAN_LIST"
#define HOME_ACTION_SETTINGS                @"HOME_ACTION_SETTINGS"


//后两个按钮
#define HOME_ACTION_FOLLOW_SINA_WEIBO       @"HOME_ACTION_FOLLOW_SINA_WEIBO"
#define HOME_ACTION_VIST_AIJIANMEI_COM      @"HOME_ACTION_VIST_AIJIANMEI_COM"







#define HOME_ACTION_BBS                     @"HOME_ACTION_BBS"
#define HOME_ACTION_SHOP                    @"HOME_ACTION_SHOP"
#define HOME_ACTION_APPS                    @"HOME_ACTION_APPS"
#define HOME_ACTION_FREE_COINS              @"HOME_ACTION_FREE_COINS"
#define HOME_ACTION_PLAY_WITH_FRIEDN        @"HOME_ACTION_PLAY_WITH_FRIEDN"


#define HOME_BOTTOM_LEARN_DRAW_DRAW         @"HOME_BOTTOM_LEARN_DRAW_DRAW"
#define HOME_BOTTOM_LEARN_DRAW_DRAFT        @"HOME_BOTTOM_LEARN_DRAW_DRAFT"
#define HOME_BOTTOM_LEARN_DRAW_SHOP         @"HOME_BOTTOM_LEARN_DRAW_SHOP"
#define HOME_BOTTOM_LEARN_DRAW_FEEDBACK     @"HOME_BOTTOM_LEARN_DRAW_FEEDBACK"

#define HOME_BOTTOM_USER                    @"HOME_BOTTOM_USER"
#define HOME_BOTTOM_OPUS                    @"HOME_BOTTOM_OPUS"
#define HOME_BOTTOM_FRIEND                  @"HOME_BOTTOM_FRIEND"
#define HOME_BOTTOM_CHAT                    @"HOME_BOTTOM_CHAT"
#define HOME_BOTTOM_MORE                    @"HOME_BOTTOM_MORE"

#define HOME_TOP_AVATAR                     @"HOME_TOP_AVATAR"
#define HOME_TOP_COINS                      @"HOME_TOP_COINS"
#define HOME_TOP_BULLETIN                   @"HOME_TOP_BULLETIN"
#define HOME_TOP_FREE_COINS                 @"HOME_TOP_FREE_COINS"

#define HOME_HOT_DRAW                       @"HOME_HOT_DRAW"


#define REGISTRATION_CLICK                  @"REGISTRATION_CLICK"
#define REGISTRATION_RESULT                 @"REGISTRATION_RESULT"

#define REGISTRATION_EMAIL                  @"EMAIL"

#define TOP_TAB_CLICK                       @"TOP_TAB_CLICK"
#define TOP_TAB_OPUS_CLICK                  @"TOP_TAB_OPUS_CLICK"

#define TOP_TAB_USERS                       @"TOP_TAB_USERS"
#define TOP_TAB_YEARLY                      @"TOP_TAB_YEARLY"
#define TOP_TAB_WEEKLY                      @"TOP_TAB_WEEKLY"
#define TOP_TAB_LATEST                      @"TOP_TAB_LATEST"

#define SHARE_ACTION_CLICK                  @"SHARE_ACTION_CLICK"

#define SHARE_ACTION_SINA                   @"SHARE_ACTION_SINA"
#define SHARE_ACTION_QQ                     @"SHARE_ACTION_QQ"
#define SHARE_ACTION_FACEBOOK               @"SHARE_ACTION_FACEBOOK"
#define SHARE_ACTION_WEIXIN_FRIEND          @"SHARE_ACTION_WEIXIN_FRIEND"
#define SHARE_ACTION_WEIXIN_TIMELINE        @"SHARE_ACTION_WEIXIN_TIMELINE"
#define SHARE_ACTION_ALBUM                  @"SHARE_ACTION_ALBUM"
#define SHARE_ACTION_EMAIL                  @"SHARE_ACTION_EMAIL"
#define SHARE_ACTION_SAVE                   @"SHARE_ACTION_SAVE"
#define SHARE_ACTION_MY_AVATAR              @"SHARE_ACTION_MY_AVATAR"
#define SHARE_ACTION_CONTACT_AVATAR         @"SHARE_ACTION_CONTACT_AVATAR"

#define CONTEST_HOME_CLICK                  @"CONTEST_HOME_CLICK"

#define CONTEST_HOME_RULE                   @"CONTEST_HOME_RULE"
#define CONTEST_HOME_OPUS                   @"CONTEST_HOME_OPUS"
#define CONTEST_HOME_JOIN                   @"CONTEST_HOME_JOIN"

#define FREE_COIN_CLICK                     @"FREE_COIN_CLICK"
#define FREE_COIN_TYPE_JIFENQIANG           @"JI_FEN_QIANG"
#define FREE_COIN_TYPE_VIDEO                @"VIDEO"
#define FREE_COIN_TYPE_MONEYTREE            @"MONEY_TREE"

#define SELECT_WORD_CLICK                           @"SELECT_WORD_CLICK_"
#define SELECT_WORD_CLICK_TYPE_HOT                  @"HOT_WORD"
#define SELECT_WORD_CLICK_TYPE_CUSTOM               @"CUSTOM_WORD"
#define SELECT_WORD_CLICK_TYPE_SYSTEM               @"SYSTEM_WORD"
#define SELECT_WORD_CLICK_TYPE_DRAFT                @"DRAFT"
#define SELECT_WORD_CLICK_TYPE_LOAD_DRAFTS          @"LOAD_DRAFTS"
#define SELECT_WORD_CLICK_TYPE_ADD_CUSTOM_WORD      @"ADD_CUSTOM_WORD"
#define SELECT_WORD_CLICK_TYPE_MORE_CUSTOM_WORDS    @"MORE_CUSTOM_WORDS"


#define DRAW_CLICK                                  @"DRAW_CLICK"
#define DRAW_CLICK_PEN                              @"DRAW_CLICK_PEN"
#define DRAW_CLICK_COLOR_BOX                        @"DRAW_CLICK_COLOR_BOX"
#define DRAW_CLICK_PALETTE                          @"DRAW_CLICK_PALETTE"
#define DRAW_CLICK_ERASER                           @"DRAW_CLICK_ERASER"
#define DRAW_CLICK_PAINT_BUCKET                     @"DRAW_CLICK_PAINT_BUCKET"
#define DRAW_CLICK_WIDTH                            @"DRAW_CLICK_WIDTH"
#define DRAW_CLICK_ALPHA                            @"DRAW_CLICK_ALPHA"
#define DRAW_CLICK_REDO                             @"DRAW_CLICK_REDO"
#define DRAW_CLICK_UNDO                             @"DRAW_CLICK_UNDO"
#define DRAW_CLICK_CHAT                             @"DRAW_CLICK_CHAT"
#define DRAW_CLICK_DRAFT                            @"DRAW_CLICK_DRAFT"
#define DRAW_CLICK_STRAW                            @"DRAW_CLICK_STRAW"
#define DRAW_CLICK_WIDTH_BOX                        @"DRAW_CLICK_WIDTH_BOX"
#define DRAW_CLICK_SHAPE_BOX                        @"DRAW_CLICK_SHAPE_BOX"

#define DRAW_CLICK_DRAWBG_BOX                       @"DRAW_CLICK_DRAWBG_BOX"
#define DRAW_CLICK_SHADOW_BOX                       @"DRAW_CLICK_SHADOW_BOX"

#define DRAW_CLICK_CANVAS_BOX                       @"DRAW_CLICK_CANVAS_BOX"
#define DRAW_CLICK_EDIT_DESC                        @"DRAW_CLICK_EDIT_DESC"
#define DRAW_CLICK_CHANGE_DRAWTOUSER                @"DRAW_CLICK_CHANGE_DRAWTOUSER"
#define DRAW_CLICK_HELP                             @"DRAW_CLICK_HELP"
#define DRAW_CLICK_GRID                             @"DRAW_CLICK_GRID"
#define DRAW_CLICK_GRADIENT                         @"DRAW_CLICK_GRADIENT"

@interface AnalyticsManager : NSObject

+ (AnalyticsManager*)sharedAnalyticsManager;

- (void)reportClickHomeMenu:(NSString*)menuName;
- (void)reportClickHomeElements:(NSString*)elementName;

- (void)reportRegistration:(NSString*)snsName;
- (void)reportRegistrationResult:(int)errorCode;

- (void)reportTopTabClicks:(NSString*)tabName;
- (void)reportTopDrawClicks:(NSString*)tabName;

- (void)reportDrawDetailsActionClicks:(NSString*)actionName;
- (void)reportShareActionClicks:(NSString*)actionName;

- (void)reportContestHomeClicks:(NSString*)name;

- (void)reportFreeCoins:(NSString*)freeCoinName;
- (void)reportSelectWord:(NSString*)wordType;

- (void)reportDrawClick:(NSString*)name;

@end
