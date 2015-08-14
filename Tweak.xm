#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <substrate.h>

static BOOL enabled = YES;
static BOOL first = YES;
#define setin_domain CFSTR("com.joemerlino.darkcc")

%hook SBControlCenterContentContainerView
-(void)controlCenterWillBeginTransition{
	%orig;
	if(first){
		first = NO;
		UIView * darkeningView = MSHookIvar<UIView*>(self,"_lighteningView");
		if(enabled){
			[darkeningView setBackgroundColor:[UIColor colorWithWhite:0 alpha:1]];
			darkeningView.alpha = 0.6;
		}
		else{
			[darkeningView setBackgroundColor:[UIColor colorWithWhite:1 alpha:1]];
			darkeningView.alpha = 0.17;
		}
	}
}
%end

static void LoadSettings()
{
	CFPreferencesAppSynchronize(CFSTR("com.joemerlino.darkcc"));
	NSString *n=(NSString*)CFPreferencesCopyAppValue(CFSTR("enabled"), setin_domain);
	enabled = (n)? [n boolValue]:YES;
	first = YES;
}

%ctor
{
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)LoadSettings, CFSTR("com.joemerlino.darkcc.preferencechanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
	LoadSettings();
}