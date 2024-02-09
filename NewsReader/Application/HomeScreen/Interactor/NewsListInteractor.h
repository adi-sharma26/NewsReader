//
//  NewsListInteractor.h
//  NewsReader
//
//  Created by Aditya Sharma on 08/02/24.
//

#import <Foundation/Foundation.h>
#import "NewsListInteractorProtocol.h"
#import "NewsListPresenterProtocol.h"
#import "Articles.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewsListInteractor : NSObject <NewsListInteractorInputProtocol>

@property (strong, nonatomic) NSArray<Articles *> *articles;

@end

NS_ASSUME_NONNULL_END
