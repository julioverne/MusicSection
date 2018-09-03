#import <dlfcn.h>
#import <objc/runtime.h>
#import <notify.h>
#import <substrate.h>

#define NSLog(...)

static void viewDidLoadCallback(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo)
{
	static BOOL loaded;
	if(!loaded && [[(NSDictionary *)userInfo objectForKey:@"UINavigationControllerNextVisibleViewController"] isKindOfClass:objc_getClass("Music.LibraryViewController")]) {
		loaded = YES;
		dispatch_async(dispatch_get_main_queue(), ^(void){
			@try {
				[((UINavigationController*)object) pushViewController:(UIViewController*)[[objc_getClass("Music.SongsViewController") alloc] init] animated:NO];
			} @catch (NSException * e) {
			}
		});
	}
}

%ctor
{
	CFNotificationCenterAddObserver(CFNotificationCenterGetLocalCenter(), NULL, viewDidLoadCallback, (CFStringRef)@"UINavigationControllerWillShowViewControllerNotification", NULL, 0);
}