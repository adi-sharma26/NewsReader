//
//  NewsListInteractorProtocol.h
//  NewsReader
//
//  Created by Aditya Sharma on 08/02/24.
//

#import <Foundation/Foundation.h>
#import "NewsListPresenterProtocol.h"

@protocol NewsListInteractorInputProtocol;

@protocol NewsListInteractorInputProtocol <NSObject>

@property(weak, nonatomic) id<NewsListInteractorOutputProtocol> output;

- (void) fetchNews;
- (NSArray *)getAllArticles;

@end
