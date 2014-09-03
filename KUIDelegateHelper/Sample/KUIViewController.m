#import "KUIViewController.h"
#import "KUIDelegateHelper.h"

@interface KUIViewController ()

- (IBAction)onPressAlertViewButton:(id)sender;
- (IBAction)onPressActionSheetButton:(id)sender;

@end

@implementation KUIViewController

- (IBAction)onPressAlertViewButton:(id)sender {
	[KUIDelegateHelper showAlertView:[[UIAlertView alloc] initWithTitle:@"Title" message:@"Message" delegate:[KUIDelegateHelper delegate] cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil] withAction:^(id sender, NSInteger buttonIndex) {
		switch (buttonIndex) {
			case 0:
				NSLog(@"Cancel");
				break;
			default:
				NSLog(@"OK");
				break;
		}
	}];
}

- (IBAction)onPressActionSheetButton:(id)sender {
	[KUIDelegateHelper showActionSheet:[[UIActionSheet alloc] initWithTitle:@"Title" delegate:[KUIDelegateHelper delegate] cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Destructive" otherButtonTitles:@"A", @"B", @"C", nil] inView:self.view withAction:^(id sender, NSInteger buttonIndex) {
		switch (buttonIndex) {
			case 0:
				NSLog(@"Destructive");
				break;
			case 1:
				NSLog(@"A");
				break;
			case 2:
				NSLog(@"B");
				break;
			case 3:
				NSLog(@"C");
				break;
			default:
				NSLog(@"Cancel");
				break;
		}
	}];
}

@end
