//
//  UIImageView+SDWebImage.m
//  NewsReader
//
//  Created by Aditya Sharma on 09/02/24.
//

#import "UIImageView+SDWebImage.h"

@implementation UIImageView (SDWebImage)

- (void)setImageWithURLString:(NSString *)urlString placeholderImage:(UIImage *)placeholder {
    NSURL *url = [NSURL URLWithString:urlString];
    
    [self sd_setImageWithURL:url
            placeholderImage:placeholder
                   completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (error) {
            NSLog(@"Error loading image from URL: %@", error.localizedDescription);
        }
    }];
}

@end
