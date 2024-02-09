//
//  NewsListEntityTests.m
//  NewsReaderTests
//
//  Created by Aditya Sharma on 09/02/24.
//

#import <XCTest/XCTest.h>
#import "Articles.h"

@interface ArticlesTests : XCTestCase

@end

@implementation ArticlesTests

- (void)testInitWithDictionary {
    
    NSDictionary *validDictionary = @{
        @"publishedAt": @"2022-01-01",
        @"title": @"Test Article",
        @"url": @"http://example.com",
        @"urlToImage": @"http://example.com/image.jpg"
    };
    
    Articles *article = [[Articles alloc] initWithDictionary:validDictionary];
    
    XCTAssertNotNil(article, @"Initialization should not be nil");
    XCTAssertEqualObjects(article.publishedAt, @"2022-01-01", @"Incorrect publishedAt value");
    XCTAssertEqualObjects(article.title, @"Test Article", @"Incorrect title value");
    XCTAssertEqualObjects(article.url, @"http://example.com", @"Incorrect url value");
    XCTAssertEqualObjects(article.urlToImage,
                          @"http://example.com/image.jpg",
                          @"Incorrect urlToImage value");
    
    NSDictionary *invalidDictionary = @{
        @"publishedAt": @"2022-01-01",
        @"title": @"Test Article",
        @"urlToImage": @"http://example.com/image.jpg"
    };
    
    Articles *invalidArticle = [[Articles alloc] initWithDictionary:invalidDictionary];
    
    XCTAssertNil(invalidArticle, @"Initialization should be nil for missing key");
}

@end

