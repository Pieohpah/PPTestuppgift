//
//  MainManager.h
//  PPTestuppgift
//
//  Created by Herber Peter on 15/08-16.
//  Copyright © 2016 Herber Peter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MainManager : NSObject

+ (MainManager*)sharedInstance;

@property(nonatomic,copy) NSString* phoneNumber;

- (void) getImageFrom: (NSURL*) url completionHandler:(void (^)(UIImage *)) handler;

@end
