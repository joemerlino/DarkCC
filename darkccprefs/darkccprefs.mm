#import <Preferences/Preferences.h>

@interface darkccprefsListController: PSListController {
}
@end

@implementation darkccprefsListController
	- (id)specifiers {
		if(_specifiers == nil) {
			_specifiers = [[self loadSpecifiersFromPlistName:@"darkccprefs" target:self] retain];
		}
		return _specifiers;
	}
	-(void)twitter {
		if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter://user?screen_name=joe_merlino"]]) {
			[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"twitter://user?screen_name=joe_merlino"]];
		} else {
			[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/joe_merlino"]];
		}
	}

	-(void)my_site {
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://github.com/joemerlino/"]];
	}

	-(void)donate {
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.paypal.com/sendmoney?email=merlino.giuseppe1@gmail.com"]];
	}
	-(void) sendEmail{
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto:merlino.giuseppe1@gmail.com?subject=DarkCC"]];
	}
@end

// vim:ft=objc