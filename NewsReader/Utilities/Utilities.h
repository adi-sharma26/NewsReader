//
//  Utilities.h
//  NewsReader
//
//  Created by Aditya Sharma on 08/02/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Utilities : NSObject

+ (id)readJSONFromFile:(NSString *)fileName ofType:(NSString *)fileType;
+ (id)parseJSON:(id)json toModel:(Class)dataModel;
+ (NSString *)convertDateString:(NSString *)inputDate;

@end

NS_ASSUME_NONNULL_END
