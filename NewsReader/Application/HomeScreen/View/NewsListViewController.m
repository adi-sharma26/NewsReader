//
//  NewsViewController.m
//  NewsReader
//
//  Created by Aditya Sharma on 08/02/24.
//

#import "NewsListViewController.h"
#import "NSObject+NibLoading.h"
#import "ArticleTableViewCell.h"
#import "NewsListPresenterProtocol.h"

@interface NewsListViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray<Articles *> *articles;
@property (assign, nonatomic) BOOL isSearching;

@end

@implementation NewsListViewController

@synthesize presenter;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:@"News"];
    [self configureTableView];
    [self.presenter onViewDidLoad];
    
    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc]
                                     initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
                                     target:self
                                     action:@selector(searchButtonTapped)];
    self.navigationItem.rightBarButtonItem = searchButton;
    self.isSearching = NO;
}

- (void)searchButtonTapped {
    
    self.isSearching = !self.isSearching;
    
    if (self.isSearching) {
        if (@available(iOS 16.0, *)) {
            [self.navigationItem.rightBarButtonItem setHidden:YES];
        } else {
            if (self.navigationItem.rightBarButtonItem) {
                [self.navigationItem.rightBarButtonItem setEnabled:NO];
                [self.navigationItem.rightBarButtonItem setTintColor:[UIColor clearColor]];
            }
        }
        UISearchBar *searchBar = [[UISearchBar alloc] init];
        searchBar.placeholder = @"Search News";
        searchBar.delegate = self;
        searchBar.showsCancelButton = true;
        [searchBar becomeFirstResponder];
        
        self.navigationItem.titleView = searchBar;
    }
}

- (void)configureTableView {
    [self registerTableViewCells];
    
    [self.tableView setEstimatedRowHeight:140];
    [self.tableView setRowHeight:UITableViewAutomaticDimension];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
}

- (void)registerTableViewCells {
    UINib *nib = [UINib nibWithNibName:ArticleTableViewCell.nibName bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:ArticleTableViewCell.nibName];
}

- (NSArray<Articles *> *)sortArticlesBySearchText:(NSString *)searchText {
    NSArray<Articles *> *sortedArticles = [self.articles sortedArrayUsingComparator:
                                           ^NSComparisonResult(Articles *article1, Articles *article2) {
        NSInteger count1 = [self countOccurrencesOfSearchText:searchText inString:article1.title];
        NSInteger count2 = [self countOccurrencesOfSearchText:searchText inString:article2.title];
        
        return (count1 > count2) ? NSOrderedAscending : ((count1 < count2) ? NSOrderedDescending : NSOrderedSame);
    }];
    
    return sortedArticles;
}

- (NSInteger)countOccurrencesOfSearchText:(NSString *)searchText inString:(NSString *)targetString {
    NSInteger count = 0;
    NSRange searchRange = NSMakeRange(0, [targetString length]);
    
    while (searchRange.location != NSNotFound) {
        searchRange = [targetString rangeOfString:searchText options:0 range:searchRange];
        if (searchRange.location != NSNotFound) {
            count++;
            searchRange = NSMakeRange(searchRange.location + searchRange.length, [targetString length] - (searchRange.location + searchRange.length));
        }
    }
    
    return count;
}

- (void)displaySearchResults:(NSArray<Articles *> *)searchResults {
    self.articles = searchResults;
    [self.tableView reloadData];
}

// MARK: - NewsListViewProtocol Implementation

- (void)updateNewsFeedWithData:(NSArray<Articles *> *)articles {
    self.articles = articles;
    [self.tableView reloadData];
}

// MARK: - UISearchBarDelegate Implementation
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    if (self.isSearching) {
        self.isSearching = !self.isSearching;
        self.articles = [self.presenter getAllArticles];
        [self.tableView reloadData];
        self.navigationItem.titleView = nil;
        if (@available(iOS 16.0, *)) {
            [self.navigationItem.rightBarButtonItem setHidden:NO];
        } else {
            if (self.navigationItem.rightBarButtonItem) {
                [self.navigationItem.rightBarButtonItem setEnabled:YES];
                [self.navigationItem.rightBarButtonItem setTintColor:[UIColor tintColor]];
            }
        }
    }
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if ([searchBar.text length] > 0) {
        [self searchForText:searchBar.text];
    }
}

- (void)searchForText:(NSString *)searchText {
    NSArray<Articles *> *sortedArticles = [self sortArticlesBySearchText:searchText];
    
    [self displaySearchResults:sortedArticles];
}

// MARK: - TableViewDataSource and UITableViewDelegate Implementation

- (UITableViewCell *)tableView:(nonnull UITableView *)tableView
         cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    ArticleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ArticleTableViewCell.nibName];
    [cell configureTableViewCell:self.articles[indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return self.articles.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.presenter onSelectRowAtIndexPath:indexPath];
}

@end
