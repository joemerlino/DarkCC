#import <UIKit/UIKit.h>

static BOOL enabled=YES;
#define setin_domain CFSTR("com.joemerlino.darkcc")

%hook SBControlCenterContentView
- (id)initWithFrame:(struct CGRect)arg1{
	if(enabled){
		id cc = %orig();
		[cc setBackgroundColor:[%c(UIColor) colorWithWhite:40.0/255 alpha:0.7]];
		return cc;
	}
	else return %orig();
}
%end

static void LoadSettings()
{
	CFPreferencesAppSynchronize(CFSTR("com.joemerlino.darkcc"));
	NSString *n=(NSString*)CFPreferencesCopyAppValue(CFSTR("enabled"), setin_domain);
	enabled = (n)? [n boolValue]:YES;
 	NSLog(@"ENABLED DARKCC: %d",enabled);
}

%ctor
{
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)LoadSettings, CFSTR("com.joemerlino.darkcc.preferencechanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
	LoadSettings();
}