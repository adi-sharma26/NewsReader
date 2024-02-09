//
//  NewsDetailsViewController.m
//  NewsReader
//
//  Created by Aditya Sharma on 09/02/24.
//

#import "NewsDetailsViewController.h"
#import <WebKit/WebKit.h>

@interface NewsDetailsViewController ()

@property (weak, nonatomic) IBOutlet WKWebView *webView;

@end

@implementation NewsDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [NSURL URLWithString:self.articleUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

@end
