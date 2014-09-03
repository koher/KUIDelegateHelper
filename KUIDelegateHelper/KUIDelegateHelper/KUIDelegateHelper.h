#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KUIDelegateHelper : NSObject <UIAlertViewDelegate, UIActionSheetDelegate>

+ (instancetype)delegate;

+ (NSInteger)tagForAction:(void (^)(id sender, NSInteger buttonIndex))action;

+ (void)showAlertView:(UIAlertView *)alertView withAction:(void (^)(id sender, NSInteger buttonIndex))action;
+ (void)showActionSheet:(UIActionSheet *)actionSheet inView:(UIView *)view withAction:(void (^)(id sender, NSInteger buttonIndex))action;

@end
