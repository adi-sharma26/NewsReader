//
//  NewsListPresenter.m
//  NewsReader
//
//  Created by Aditya Sharma on 08/02/24.
//

#import "NewsListPresenter.h"

@implementation NewsListPresenter

- (void)onViewDidLoad {
    [self.interactor fetchNews];
}

- (void)onSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.router pushNewsDetailsViewController:
     [[self.interactor getAllArticles] objectAtIndex:indexPath.row]];
}

- (void)newsFetchFailedWithError:(NSError *)error {
    NSLog(@"Fetching failed due to: %@", error.localizedDescription);
}

- (void)newsFetchedSuccessfully:(NSArray *)response {
    [self.view updateNewsFeedWithData:response];
}

- (NSArray *)getAllArticles {
    return [self.interactor getAllArticles];
}

@end
