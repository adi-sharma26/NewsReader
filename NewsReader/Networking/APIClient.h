//
//  APIClient.h
//  NewsReader
//
//  Created by Aditya Sharma on 08/02/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface APIClient : NSObject

- (NSArray *)fetchNewsArticles;

@end

NS_ASSUME_NONNULL_END
