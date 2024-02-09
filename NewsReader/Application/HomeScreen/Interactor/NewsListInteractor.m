//
//  NewsListInteractor.m
//  NewsReader
//
//  Created by Aditya Sharma on 08/02/24.
//

#import "NewsListInteractor.h"
#import "Utilities.h"
#import "Articles.h"

@interface NewsListInteractor ()

@end

@implementation NewsListInteractor

@synthesize output;

- (void)fetchNews {
    id jsonData = [Utilities readJSONFromFile:@"articles" ofType:@"json"];
    id parsedResponse = [Utilities parseJSON:jsonData toModel:Articles.class];
    
    if (parsedResponse != nil && [parsedResponse isKindOfClass:[NSArray class]]) {
        
        NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"publishedAt" ascending:YES];
        NSArray<Articles *> *sortedArray = [parsedResponse sortedArrayUsingDescriptors:@[sortDescriptor]];
        self.articles = sortedArray;
        [self.output newsFetchedSuccessfully:sortedArray];
    } else {
        [self.output newsFetchFailedWithError:
         [NSError errorWithDomain:@"com.fetchNews"
                             code:0
                         userInfo:@{NSLocalizedDescriptionKey: @"Data parsing failed"}]];
    }
}

- (NSArray *)getAllArticles {
    if ([self.articles count] > 0) {
        return self.articles;
    } else {
        return [NSArray array];
    }
}

@end
