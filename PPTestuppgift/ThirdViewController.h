//
//  ThirdViewController.h
//  PPTestuppgift
//
//  Created by Herber Peter on 15/08-16.
//  Copyright © 2016 Herber Peter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
- (IBAction)callTapped:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *callButton;

@end
