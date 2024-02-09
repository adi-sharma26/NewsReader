//
//  NewsListViewControllerTests.m
//  NewsListViewControllerTests
//
//  Created by Aditya Sharma on 08/02/24.
//

#import <XCTest/XCTest.h>
#import "NewsListViewController.h"
#import "NewsListPresenterProtocol.h"
#import "ArticleTableViewCell.h"
#import <OCMock/OCMock.h>

@interface NewsListViewControllerTests : XCTestCase

@property (nonatomic, strong) NewsListViewController *viewController;
@property (nonatomic, strong) id<NewsListPresenterInputProtocol> mockPresenter;

@end

@implementation NewsListViewControllerTests

- (void)setUp {
    [super setUp];
    self.viewController = [[NewsListViewController alloc] init];
    self.mockPresenter = OCMProtocolMock(@protocol(NewsListPresenterInputProtocol));
    self.viewController.presenter = self.mockPresenter;
    [self.viewController loadViewIfNeeded];
}

- (void)tearDown {
    self.viewController = nil;
    self.mockPresenter = nil;
    [super tearDown];
}

- (void)testViewDidLoad {
    OCMExpect([self.mockPresenter onViewDidLoad]);
    
    [self.viewController viewDidLoad];
    
    OCMVerifyAll(self.mockPresenter);
}

@end
