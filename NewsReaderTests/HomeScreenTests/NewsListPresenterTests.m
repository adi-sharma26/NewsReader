//
//  NewsListPresenterTests.m
//  NewsReaderTests
//
//  Created by Aditya Sharma on 09/02/24.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "NewsListPresenterProtocol.h"
#import "NewsListInteractorProtocol.h"
#import "NewsListRouterProtocol.h"
#import "NewsListPresenter.h"
#import "NewsListRouter.h"
#import "NewsListViewProtocol.h"
#import "Articles.h"

@interface NewsListPresenterTests : XCTestCase

@property (nonatomic, strong) NewsListPresenter *presenter;
@property (nonatomic, strong) id<NewsListInteractorInputProtocol> mockInteractor;
@property (nonatomic, strong) id<NewsListRouterProtocol> mockRouter;
@property (nonatomic, strong) id<NewsListViewProtocol> mockView;

@end

@implementation NewsListPresenterTests

- (void)setUp {
    [super setUp];
    self.mockInteractor = OCMProtocolMock(@protocol(NewsListInteractorInputProtocol));
    self.mockRouter = OCMProtocolMock(@protocol(NewsListRouterProtocol));
    self.mockView = OCMProtocolMock(@protocol(NewsListViewProtocol));

    self.presenter = [[NewsListPresenter alloc] init];
    self.presenter.interactor = self.mockInteractor;
    self.presenter.router = self.mockRouter;
    self.presenter.view = self.mockView;
}

- (void)tearDown {
    self.mockInteractor = nil;
    self.mockRouter = nil;
    self.mockView = nil;
    self.presenter = nil;
    [super tearDown];
}

- (void)testOnViewDidLoad {
    OCMExpect([self.mockInteractor fetchNews]);

    [self.presenter onViewDidLoad];

    OCMVerifyAll(self.mockInteractor);
}

- (void)testOnSelectRowAtIndexPath {
    NSDictionary *articleData = @{@"title": @"Article 1"};
    Articles *mockArticle = [[Articles alloc] initWithDictionary:articleData];
    NSArray *mockArticles = @[mockArticle];
    OCMStub([self.mockInteractor getAllArticles]).andReturn(mockArticles);

    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    OCMExpect([self.mockRouter pushNewsDetailsViewController:OCMOCK_ANY]);

    [self.presenter onSelectRowAtIndexPath:indexPath];

    OCMVerifyAll(self.mockRouter);
}

- (void)testNewsFetchFailedWithError {
    NSError *mockError = [NSError errorWithDomain:@"MockDomain" code:123 userInfo:nil];

    [self.presenter newsFetchFailedWithError:mockError];

    OCMVerifyAll(self.mockView);
}

- (void)testNewsFetchedSuccessfully {

    NSDictionary *articleData = @{@"title": @"Article 1"};
    Articles *mockArticle = [[Articles alloc] initWithDictionary:articleData];
    NSArray *mockArticles = @[mockArticle];

    OCMExpect([self.mockView updateNewsFeedWithData:OCMOCK_ANY]);

    [self.presenter newsFetchedSuccessfully:mockArticles];

    OCMVerifyAll(self.mockView);
}

- (void)testGetAllArticles {
    NSDictionary *articleData = @{@"title": @"Article 1"};
    Articles *mockArticle = [[Articles alloc] initWithDictionary:articleData];
    NSArray *mockArticles = @[mockArticle];
    OCMStub([self.mockInteractor getAllArticles]).andReturn(mockArticles);

    XCTAssertEqualObjects([self.presenter getAllArticles],
                          mockArticles,
                          @"getAllArticles should return the correct articles");
}

@end
