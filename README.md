KUIDelegateHelper
=================

__KUIDelegateHelper__ is a class to help generating and managing delegates for UIAlertView and UIActionSheet.

Usage
-----

### UIAlertView

```objc
[KUIDelegateHelper
    showAlertView:[[UIAlertView alloc]
        initWithTitle:@"Title"
        message:@"Message"
        delegate:[KUIDelegateHelper delegate]
        cancelButtonTitle:@"Cancel"
        otherButtonTitles:@"OK", nil]
    withAction:^(id sender, NSInteger buttonIndex) {
        switch (buttonIndex) {
            case 0:
                NSLog(@"Cancel");
                break;
            default:
                NSLog(@"OK");
                break;
        }
    }];
```

### UIActionSheet

```objc
[KUIDelegateHelper
    showActionSheet:[[UIActionSheet alloc]
        initWithTitle:@"Title"
        delegate:[KUIDelegateHelper delegate]
        cancelButtonTitle:@"Cancel"
        destructiveButtonTitle:@"Destructive"
        otherButtonTitles:@"A", @"B", @"C", nil]
    inView:self.view
    withAction:^(id sender, NSInteger buttonIndex) {
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
```

How to Install
--------------

Put the following files into your project.

- KUIDelegateHelper/KUIDelegateHelper/KUIDelegateHelper.h
- KUIDelegateHelper/KUIDelegateHelper/KUIDelegateHelper.m

License
-------

MIT License. Read [the LICENSE file](LICENSE).
