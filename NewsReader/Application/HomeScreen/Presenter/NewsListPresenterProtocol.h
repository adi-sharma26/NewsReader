//
//  NewsListPresenterProtocol.h
//  NewsReader
//
//  Created by Aditya Sharma on 08/02/24.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol NewsListPresenterInputProtocol;
@protocol NewsListInteractorOutputProtocol;

@protocol NewsListPresenterInputProtocol <NSObject>

- (void)onViewDidLoad;
- (void)onSelectRowAtIndexPath:(NSIndexPath *)indexPath;
- (NSArray *)getAllArticles;

@end

@protocol NewsListInteractorOutputProtocol <NSObject>

- (void)newsFetchedSuccessfully:(NSArray *)response;
- (void)newsFetchFailedWithError:(NSError *)error;

@end
