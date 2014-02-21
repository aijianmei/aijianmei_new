//
//  GameAppProtocol.h
//  Draw
//
//  Created by  on 12-8-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PPViewController.h"


@protocol GameAppProtocol <NSObject>

- (NSString*)appId;
- (NSString*)gameId;
- (NSString*)umengId;
- (BOOL)disableAd;

// image resources
- (NSString*)background;
- (NSString*)defaultBroadImage;
- (NSString*)defaultAdBoardImage;
- (NSString*)lmwallId;
- (NSString*)lmAdPublisherId;
- (NSString*)aderAdPublisherId;
- (NSString*)mangoAdPublisherId;
- (NSString*)wanpuAdPublisherId;

- (NSString*)sinaAppKey;
- (NSString*)sinaAppSecret;
- (NSString*)sinaAppRedirectURI;

- (NSString*)qqAppKey;
- (NSString*)qqAppSecret;
- (NSString*)qqAppRedirectURI;

- (NSString*)facebookAppKey;
- (NSString*)facebookAppSecret;

- (NSString*)removeAdProductId;

- (NSString*)askFollowTitle;
- (NSString*)askFollowMessage;
- (NSString*)sinaWeiboId;
- (NSString*)qqWeiboId;

- (NSString*)shareMessageBody;
- (NSString*)shareEmailSubject;
- (NSString*)feedbackTips;



- (NSString *)helpViewBgImageName;
- (NSString *)gameRulesButtonBgImageNameForNormal;
- (NSString *)gameRulesButtonBgImageNameForSelected;
- (NSString *)itemsUsageButtonBgImageNameForNormal;
- (NSString *)itemsUsageButtonBgImageNameForSelected;

- (NSString *)upgradeMessage:(int)newLevel;
- (NSString *)degradeMessage:(int)newLevel;

- (NSString *)popupMessageDialogBackgroundImage;

- (BOOL)supportWeixin;

- (NSString *)weixinId;

- (NSString*)homeHeaderViewId;

- (NSString *)roomListCellBgImageName;
- (NSString *)roomListCellDualBgImageName;
- (NSString *)roomTitle;

- (UIColor*)popupMessageDialogFontColor;


- (NSString *)shengmengAppId;

//create room dialog color
- (UIColor*)createRoomDialogRoomNameColor;
- (UIColor*)createRoomDialogRoomPasswordColor;
- (UIColor*)buttonTitleColor;

- (NSString*)shopTitle;
- (NSArray*)cacheArray;

- (NSString*)getBackgroundMusicName;


- (NSString*)youmiWallId;
- (NSString*)youmiWallSecret;
- (NSString*)aderWallId;
- (NSString*)domodWallId;
- (NSString*)tapjoyWallId;
- (NSString*)tapjoyWallSecret;




- (NSString *)alipayCallBackScheme;

- (BOOL)isAutoRegister;

- (BOOL)canShareViaSNS;

- (BOOL)hasBBS;

- (BOOL)hasAllColorGroups;

- (UIColor *)homeMenuColor;

- (BOOL)canSubmitDraw;

- (BOOL)hasBGOffscreen;

- (BOOL)canPayWithAlipay;

- (BOOL)canGift;

- (PPViewController *)homeController;

- (BOOL)forceSaveDraft;

- (void)HandleWithDidFinishLaunching;

- (void)HandleWithDidBecomeActive;

- (void)createConfigData;

- (BOOL)showPaintCategory;

- (NSString*)getDefaultSNSSubject;

- (NSString*)appItuneLink;
- (NSString*)appLinkUmengKey;

- (BOOL)forceChineseOpus;
- (BOOL)disableEnglishGuess;

- (NSString*)iapResourceFileName;

- (void)createIAPTestDataFile;

- (BOOL)showLocateButton;

- (int)photoUsage;
- (NSString*)keywordSmartDataCn;
- (NSString*)keywordSmartDataEn;
- (NSString*)photoTagsCn;
- (NSString*)photoTagsEn;

@end

@protocol ContentGameAppProtocol <GameAppProtocol>

- (int)sellContentType;

- (NSArray *)homeTabIDList;
- (NSArray *)homeTabTitleList;

@end
