//
//  NewsListInteractorTests.m
//  NewsReaderTests
//
//  Created by Aditya Sharma on 09/02/24.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "NewsListInteractor.h"
#import "Utilities.h"
#import "Articles.h"

@interface NewsListInteractorTests : XCTestCase

@property (nonatomic, strong) NewsListInteractor *interactor;
@property (nonatomic, strong) id mockOutput;

@end

@implementation NewsListInteractorTests

- (void)setUp {
    [super setUp];
    self.interactor = [[NewsListInteractor alloc] init];
    self.mockOutput = OCMProtocolMock(@protocol(NewsListInteractorOutputProtocol));
    self.interactor.output = self.mockOutput;
}

- (void)tearDown {
    self.interactor = nil;
    self.mockOutput = nil;
    [super tearDown];
}

- (void)testFetchNewsSuccessfully {
    [self.interactor fetchNews];
    
    OCMVerifyAll(self.mockOutput);
}

- (void)testGetAllArticles {
    id jsonData = [Utilities readJSONFromFile:@"articles" ofType:@"json"];
    NSArray *parsedArray = [Utilities parseJSON:jsonData toModel:[Articles class]];
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor
                                        sortDescriptorWithKey:@"publishedAt" ascending:YES];
    
    NSArray<Articles *> *sortedArray = [parsedArray sortedArrayUsingDescriptors:@[sortDescriptor]];
    
    self.interactor.articles = sortedArray;
    
    XCTAssertEqualObjects([self.interactor getAllArticles],
                          sortedArray,
                          @"getAllArticles should return the correct articles");
}

@end
