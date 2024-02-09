//
//  Utilities.m
//  NewsReader
//
//  Created by Aditya Sharma on 08/02/24.
//

#import "Utilities.h"
#import "NSArray+Map.h"

@implementation Utilities

+ (id)readJSONFromFile:(NSString *)fileName ofType:(NSString *)fileType {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:fileType];
    
    NSData *jsonData = [NSData dataWithContentsOfFile:filePath];
    
    if (jsonData) {
        NSError *error = nil;
        id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingAllowFragments
                                                          error:&error];
        
        if (error) {
            NSLog(@"Error parsing JSON: %@", error.localizedDescription);
        } else {
            if ([jsonObject isKindOfClass:[NSDictionary class]]) {
                NSDictionary *jsonDictionary = (NSDictionary *)jsonObject;
                return jsonDictionary;
            } else if ([jsonObject isKindOfClass:[NSArray class]]) {
                NSArray *jsonArray = (NSArray *)jsonObject;
                return jsonArray;
            } else {
                return (NSString *)jsonObject;
            }
        }
    } else {
        NSLog(@"Could not read %@.json", fileName);
    }
    
    return [NSString stringWithFormat:@"Could not read %@.json", fileName];
}

+ (id)parseJSON:(id)json toModel:(Class)dataModel {
    
    if ([json isKindOfClass:[NSArray class]]) {
        NSArray *parsedArray = [json map:^id(NSDictionary *dict, NSUInteger idx) {
            return [[dataModel alloc] initWithDictionary:dict];
        }];
        
        return parsedArray;
    } else if ([json isKindOfClass:[NSDictionary class]]) {
        NSArray *jsonArray = json[@"articles"];
        NSArray *parsedArray = [jsonArray map:^id(NSDictionary *dict, NSUInteger idx) {
            return [[dataModel alloc] initWithDictionary:dict];
        }];
        return parsedArray;
    }
    
    NSLog(@"Could not parse given json");
    
    return [NSString stringWithFormat:@"Could not parse given json"];
}

+ (NSString *)convertDateString:(NSString *)inputDate {
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    
    NSDate *date = [inputFormatter dateFromString:inputDate];
    
    if (date) {
        NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
        [outputFormatter setDateFormat:@"EEE, d MMMM yyyy"];
        
        NSString *outputString = [outputFormatter stringFromDate:date];
        
        return outputString;
    } else {
        NSLog(@"Error: Unable to parse date string %@", inputDate);
        return [NSString stringWithFormat:@"Error: Unable to parse date string %@", inputDate];
    }
}


@end
