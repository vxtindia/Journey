#import "PFMMomentListViewController.h"
#import "Application.h"

@implementation PFMMomentListViewController

@synthesize
  webView=_webView
;

- (id)init {
  self = [super initWithNibName:@"MomentListView" bundle:nil];
  return self;
}

- (void)loadView {
  [super loadView];

  PFMUser *user = [NSApp sharedUser];
  user.momentsDelegate = self;

  [[NSApp sharedUser] fetchMoments];
}

#pragma mark - PFMUserMomentsDelegate

- (void)didFetchMoments:(NSArray *)moments {
  NSString *webViewPath = [[$ resourcePath] $append:@"/WebView/"];
  NSString *html = [NSString stringWithContentsOfFile:[webViewPath $append:@"index.html"] encoding:NSUTF8StringEncoding error:NULL];
  [[self.webView mainFrame] loadHTMLString:html baseURL:[NSURL fileURLWithPath:webViewPath]];
}

#pragma mark WebUIDelegate

- (NSArray *)webView:(WebView *)sender contextMenuItemsForElement:(NSDictionary *)element defaultMenuItems:(NSArray *)defaultMenuItems {
  return nil;
}

@end
