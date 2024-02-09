//
//  Articles.h
//  NewsReader
//
//  Created by Aditya Sharma on 08/02/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class Articles;

@interface Articles : NSObject

@property (nonatomic, nullable, copy) NSString *publishedAt;
@property (nonatomic, nullable, copy) NSString *title;
@property (nonatomic, nullable, copy) NSString *url;
@property (nonatomic, nullable, copy) NSString *urlToImage;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
