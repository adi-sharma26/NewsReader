//
//  Articles.m
//  NewsReader
//
//  Created by Aditya Sharma on 08/02/24.
//

#import "Articles.h"

@implementation Articles

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        if (!dictionary[@"publishedAt"] || !dictionary[@"title"] || !dictionary[@"url"] || !dictionary[@"urlToImage"]) {
            return nil;
        }
        
        _publishedAt = dictionary[@"publishedAt"];
        _title = dictionary[@"title"];
        _url = dictionary[@"url"];
        _urlToImage = dictionary[@"urlToImage"];
    }
    return self;
}


@end
