//
//  FirstViewController.h
//  PPTestuppgift
//
//  Created by Herber Peter on 15/08-16.
//  Copyright © 2016 Herber Peter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *im1;
@property (weak, nonatomic) IBOutlet UIImageView *im2;
@property (weak, nonatomic) IBOutlet UIImageView *im3;

@property (weak, nonatomic) IBOutlet UIImageView *im4;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *ai1;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *ai2;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *ai3;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *ai4;

- (IBAction)goButtonTapped:(id)sender;
- (IBAction)clearButtonTapped:(id)sender;
@end

