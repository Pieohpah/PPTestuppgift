//
//  FirstViewController.m
//  PPTestuppgift
//
//  Created by Herber Peter on 15/08-16.
//  Copyright © 2016 Herber Peter. All rights reserved.
//

#import "FirstViewController.h"
#import "App.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //[dispatch_async(dispatch_get_main_queue(), ^{
    dispatch_async(dispatch_get_main_queue(), ^{
        self.im1.image = nil;
        self.im2.image = nil;
        self.im3.image = nil;
        self.im4.image = nil;
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goButtonTapped:(id)sender {
    
    [self.ai1 startAnimating];
    [self.ai2 startAnimating];
    [self.ai3 startAnimating];
    [self.ai4 startAnimating];
    
    [MainManager.sharedInstance getImageFrom:[[NSURL alloc] initWithString:url1]  completionHandler:^(UIImage * im) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if(!im) {
                self.im1.image = [UIImage imageNamed:@"NoImage"];
            } else {
                self.im1.image = im;
            }
            [self.ai1 stopAnimating];
        });
        
    }];
    [MainManager.sharedInstance getImageFrom:[[NSURL alloc] initWithString:url2]  completionHandler:^(UIImage * im) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if(!im) {
                self.im2.image = [UIImage imageNamed:@"NoImage"];
            } else {
                self.im2.image = im;
            }
            [self.ai2 stopAnimating];
        });
        
    }];
    [MainManager.sharedInstance getImageFrom:[[NSURL alloc] initWithString:url3]  completionHandler:^(UIImage * im) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if(!im) {
                self.im3.image = [UIImage imageNamed:@"NoImage"];
            } else {
                self.im3.image = im;
            }
            [self.ai3 stopAnimating];
        });
        
    }];
    [MainManager.sharedInstance getImageFrom:[[NSURL alloc] initWithString:url4]  completionHandler:^(UIImage * im) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if(!im) {
                self.im4.image = [UIImage imageNamed:@"NoImage"];
            } else {
                self.im4.image = im;
            }
            [self.ai4 stopAnimating];
        });
        
    }];

}

- (IBAction)clearButtonTapped:(id)sender {
    dispatch_async(dispatch_get_main_queue(), ^{
        self.im1.image = nil;
        self.im2.image = nil;
        self.im3.image = nil;
        self.im4.image = nil;
    });
}
@end
