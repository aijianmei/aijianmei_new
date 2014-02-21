
#import "GameApp.h"

static NSObject<GameAppProtocol>* currentApp;

NSObject<ContentGameAppProtocol>* getContentGameApp()
{
    NSObject<GameAppProtocol>* app = getGameApp();
    if ([app conformsToProtocol:@protocol(ContentGameAppProtocol)]){
        return (NSObject<ContentGameAppProtocol>*)app;
    }
    else{
        PPDebug(@"WANRING, get content game app but app is not content game!!!");
        return nil;
    }
}

NSObject<GameAppProtocol>* appWithName(NSString *name){
    Class class = NSClassFromString(name);
    currentApp = [[[class class] alloc] init];
    
    return currentApp;
}


NSObject<GameAppProtocol>* getGameApp()
{
    if (currentApp != nil)
        return currentApp;
    
    NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];  
    NSString *bundleId = [infoDict objectForKey:@"CFBundleIdentifier"];
    
    if ([bundleId isEqualToString:DRAW_APP_BUNDLE_ID]){
        currentApp = appWithName(@"DrawGameApp");
    }
    else{
        PPDebug(@"<Warning> !!!!!!! GameApp Not Found by Bundle Id(%@) !!!!!!!!!", bundleId);
    }
    
    return currentApp;
}


BOOL isDrawApp()
{
    return ([[GameApp gameId] isEqualToString:DRAW_GAME_ID]);
}


GameAppType gameAppType()
{
    if ([[GameApp gameId] isEqualToString:DRAW_GAME_ID]) {
        return GameAppTypeDraw;
    } 
       return GameAppTypeUnknow;
}
