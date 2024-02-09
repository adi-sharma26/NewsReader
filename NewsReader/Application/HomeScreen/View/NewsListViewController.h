//
//  NewsViewController.h
//  NewsReader
//
//  Created by Aditya Sharma on 08/02/24.
//

#import <UIKit/UIKit.h>
#import "NewsListViewProtocol.h"
#import "NewsListPresenterProtocol.h"

@interface NewsListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, NewsListViewProtocol, UISearchBarDelegate>

@property (strong, nonatomic) id<NewsListPresenterInputProtocol> presenter;

@end

