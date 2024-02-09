//
//  ArticleTableViewCell.m
//  NewsReader
//
//  Created by Aditya Sharma on 08/02/24.
//

#import "ArticleTableViewCell.h"
#import "UIImageView+SDWebImage.h"
#import "Utilities.h"

@implementation ArticleTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [[self.mainView layer] setCornerRadius:8];
    [[self.articleImageView layer] setCornerRadius:8];
    [self setSelected:false];
}

- (void)configureTableViewCell:(Articles *) article {
    [self.titleLabel setText:article.title];
    [self.publishedDateLabel setText:[Utilities convertDateString:article.publishedAt]];
    [self.articleImageView setImageWithURLString:article.urlToImage
                                placeholderImage:[UIImage imageNamed:@"placeholder"]];
}

@end
