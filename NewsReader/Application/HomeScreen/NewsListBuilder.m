//
//  NewListBuilder.m
//  NewsReader
//
//  Created by Aditya Sharma on 08/02/24.
//

#import "NewsListBuilder.h"
#import "NSObject+NibLoading.h"
#import "NewsListRouter.h"

@implementation NewsListBuilder

+ (NewsListViewController *)buildNewsListModule {
    
    id storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    NewsListViewController *view = [storyboard
                                    instantiateViewControllerWithIdentifier:NewsListViewController.nibName];
    NewsListPresenter *presenter = [[NewsListPresenter alloc] init];
    NewsListInteractor *interactor = [[NewsListInteractor alloc] init];
    NewsListRouter *router = [[NewsListRouter alloc] init];
    
    view.presenter = presenter;
    presenter.view = view;
    presenter.router = router;
    presenter.interactor = interactor;
    interactor.output = presenter;
    router.viewController = view;
    
    return view;
}

@end
