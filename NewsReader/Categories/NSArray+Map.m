//
//  NSArray+Map.m
//  NewsReader
//
//  Created by Aditya Sharma on 08/02/24.
//

#import "NSArray+Map.h"

@implementation NSArray (Map)

- (NSArray *)map:(id (^)(id obj, NSUInteger idx))block {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:self.count];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        id mappedObj = block(obj, idx);
        if (mappedObj) {
            [result addObject:mappedObj];
        }
    }];
    return result;
}

@end
