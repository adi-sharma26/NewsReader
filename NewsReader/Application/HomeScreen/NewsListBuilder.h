//
//  NewListBuilder.h
//  NewsReader
//
//  Created by Aditya Sharma on 08/02/24.
//

#import <Foundation/Foundation.h>
#import "NewsListViewProtocol.h"
#import "NewsListPresenterProtocol.h"
#import "NewsListInteractorProtocol.h"
#import "NewsListViewController.h"
#import "NewsListPresenter.h"
#import "NewsListInteractor.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewsListBuilder : NSObject

+ (NewsListViewController *)buildNewsListModule;

@end

NS_ASSUME_NONNULL_END
