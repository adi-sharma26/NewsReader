//
//  NewsListPresenter.h
//  NewsReader
//
//  Created by Aditya Sharma on 08/02/24.
//

#import <Foundation/Foundation.h>
#import "NewsListViewProtocol.h"
#import "NewsListInteractor.h"
#import "NewsListInteractorProtocol.h"
#import "NewsListRouterProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@protocol NewsListViewProtocol;

@interface NewsListPresenter : NSObject <NewsListPresenterInputProtocol, NewsListInteractorOutputProtocol>

@property (weak, nonatomic) UIViewController<NewsListViewProtocol> * _Nullable view;
@property (strong, nonatomic) id<NewsListInteractorInputProtocol> interactor;
@property (strong, nonatomic) id<NewsListRouterProtocol> router;

@end

NS_ASSUME_NONNULL_END
