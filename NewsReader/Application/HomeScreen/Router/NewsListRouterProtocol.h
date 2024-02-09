//
//  NewsListRouterProtocol.h
//  NewsReader
//
//  Created by Aditya Sharma on 09/02/24.
//

#import <Foundation/Foundation.h>
#import "NewsListViewController.h"

NS_ASSUME_NONNULL_BEGIN

@protocol NewsListRouterProtocol;
@class NewsListViewController;

@protocol NewsListRouterProtocol <NSObject>

@property (weak, nonatomic) NewsListViewController *viewController;

- (void) pushNewsDetailsViewController:(NSString *)articleUrl;

@end

NS_ASSUME_NONNULL_END
