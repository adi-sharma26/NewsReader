//
//  UIImageView+SDWebImage.h
//  NewsReader
//
//  Created by Aditya Sharma on 09/02/24.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <SDWebImage/SDWebImage.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (SDWebImage)

- (void)setImageWithURLString:(NSString *)urlString placeholderImage:(UIImage *)placeholder;

@end

NS_ASSUME_NONNULL_END
