//
//  SecondViewController.h
//  PPTestuppgift
//
//  Created by Herber Peter on 15/08-16.
//  Copyright © 2016 Herber Peter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ContactsUI/ContactsUI.h>

@interface SecondViewController : UIViewController <CNContactPickerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;

- (IBAction)phoneButtonTapped:(id)sender;

@end

