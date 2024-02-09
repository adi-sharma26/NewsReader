//
//  NSArray+Map.h
//  NewsReader
//
//  Created by Aditya Sharma on 08/02/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (Map)

- (NSArray *)map:(id (^)(id obj, NSUInteger idx))block;

@end

NS_ASSUME_NONNULL_END
