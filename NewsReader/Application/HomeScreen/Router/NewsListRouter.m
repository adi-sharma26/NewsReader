//
//  NewsListRouter.m
//  NewsReader
//
//  Created by Aditya Sharma on 08/02/24.
//

#import "NewsListRouter.h"
#import <UIKit/UIKit.h>
#import "NewsDetailsViewController.h"
#import "NSObject+NibLoading.h"

@implementation NewsListRouter

@synthesize viewController;

- (void)pushNewsDetailsViewController:(NSString *)articleUrl {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    NewsDetailsViewController *detailsViewController = [storyboard
                                                        instantiateViewControllerWithIdentifier:
                                                            NewsDetailsViewController.nibName];
    detailsViewController.articleUrl = articleUrl;
    [[self.viewController navigationController] pushViewController:detailsViewController animated:YES];
}

@end
