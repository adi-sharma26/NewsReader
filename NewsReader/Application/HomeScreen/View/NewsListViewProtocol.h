//
//  NewsListViewProtocol.h
//  NewsReader
//
//  Created by Aditya Sharma on 08/02/24.
//

#import <Foundation/Foundation.h>
#import "Articles.h"

NS_ASSUME_NONNULL_BEGIN

@protocol NewsListViewProtocol;

@protocol NewsListViewProtocol <NSObject>

- (void)updateNewsFeedWithData:(NSArray<Articles *> *) articles;

@end

NS_ASSUME_NONNULL_END
