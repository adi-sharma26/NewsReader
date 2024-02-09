//
//  ArticleTableViewCell.h
//  NewsReader
//
//  Created by Aditya Sharma on 08/02/24.
//

#import <UIKit/UIKit.h>
#import "Articles.h"

NS_ASSUME_NONNULL_BEGIN

@interface ArticleTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UIImageView *articleImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *publishedDateLabel;

- (void)configureTableViewCell:(Articles *) article;

@end

NS_ASSUME_NONNULL_END
