#import "KUIDelegateHelper.h"

static KUIDelegateHelper *instance = nil;

static NSInteger counter;
static id counterLock;

static NSMutableDictionary *tagToAction;

@interface KUIDelegateHelper ()

+ (void)performActionForSender:(id)sender withTag:(NSInteger)tag buttonIndex:(NSInteger)buttonIndex;

@end

@implementation KUIDelegateHelper

+ (void)initialize {
	if (self == [KUIDelegateHelper class]) {
		instance = [[KUIDelegateHelper alloc] init];
		
		counter = 0;
		counterLock = [[NSObject alloc] init];
		
		tagToAction = [[NSMutableDictionary alloc] initWithCapacity:10];
	}
}

+ (instancetype)delegate {
	return instance;
}

+ (NSInteger)tagForAction:(void (^)(id sender, NSInteger buttonIndex))action {
	@synchronized(counterLock) {
		tagToAction[@(counter)] = action;
		
		return counter++;
	}
}

+ (void)showAlertView:(UIAlertView *)alertView withAction:(void (^)(id sender, NSInteger buttonIndex))action {
	alertView.tag = [KUIDelegateHelper tagForAction:action];
	[alertView show];
}

+ (void)showActionSheet:(UIActionSheet *)actionSheet inView:(UIView *)view withAction:(void (^)(id sender, NSInteger buttonIndex))action {
	actionSheet.tag = [KUIDelegateHelper tagForAction:action];
	[actionSheet showInView:view];
}

+ (void)performActionForSender:(id)sender withTag:(NSInteger)tag buttonIndex:(NSInteger)buttonIndex {
	NSNumber *tagNumber = @(tag);
	((void (^)())tagToAction[tagNumber])(sender, buttonIndex);
	[tagToAction removeObjectForKey:tagNumber];
}

#pragma mark UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	[KUIDelegateHelper performActionForSender:alertView withTag:alertView.tag buttonIndex:buttonIndex];
}

#pragma mark UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
	[KUIDelegateHelper performActionForSender:actionSheet withTag:actionSheet.tag buttonIndex:buttonIndex];
}

@end
