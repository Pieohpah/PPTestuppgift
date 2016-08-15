//
//  MainManager.m
//  PPTestuppgift
//
//  Created by Herber Peter on 15/08-16.
//  Copyright © 2016 Herber Peter. All rights reserved.
//

#import "MainManager.h"

@interface MainManager()
    @property (strong,nonatomic) NSURLSession* urlSession;
@end

@implementation MainManager

+ (MainManager*)sharedInstance
{
    static MainManager *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[MainManager alloc] init];
    });
    return _sharedInstance;
}

-(NSURLSession*) urlSession {
    if(!_urlSession) {
        _urlSession = [NSURLSession sessionWithConfiguration: [NSURLSessionConfiguration ephemeralSessionConfiguration]];//[NSURLSession sharedSession];
    }
    return _urlSession;
}



- (void) getImageFrom: (NSURL*) url completionHandler:(void (^)(UIImage *)) handler {
    NSURLSessionTask *task = [self.urlSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            UIImage *image = [UIImage imageWithData:data];
            if (image) {
                handler(image);
            }
        } else {
            handler(nil);
        }
    }];
    [task resume];
    
}

@end
