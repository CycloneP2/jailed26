#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

// ============================================
// SIMPLE TEST TWEAK - NO OFFSET, NO ESP
// ============================================

%hook UIApplication

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    BOOL ret = %orig;
    
    // Munculin alert 5 detik setelah game launch
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        UIAlertController *alert = [UIAlertController 
            alertControllerWithTitle:@"✅ EDGY TEST" 
            message:@"Tweak berhasil di inject! Kalo lo liat pesan ini, berarti Theos Jailed jalan." 
            preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:ok];
        
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        if (!window) {
            window = [UIApplication sharedApplication].windows.firstObject;
        }
        if (window) {
            [window.rootViewController presentViewController:alert animated:YES completion:nil];
        }
    });
    
    return ret;
}

%end

%ctor {
    %init;
    NSLog(@"✅ SIMPLE TEST TWEAK LOADED");
}
