//
//  SecondViewController.m
//  PPTestuppgift
//
//  Created by Herber Peter on 15/08-16.
//  Copyright © 2016 Herber Peter. All rights reserved.
//

#import "SecondViewController.h"
#import "App.h"


@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.phoneTextField.text = @"";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)phoneButtonTapped:(id)sender {
    
    CNContactStore* cn = [[CNContactStore alloc] init];
    [cn requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if(!granted) {
            return;
        }
    }];
    
    CNContactPickerViewController* picker = [[CNContactPickerViewController alloc] init];
    picker.delegate = self;
    [self presentViewController:picker animated:YES completion:^{
        NSLog(@"Presented picker");
    }];
    
}

-(void) contactPicker:(CNContactPickerViewController *)picker didSelectContact:(CNContact *)contact {
    NSLog(@"Picked %@",contact);
    CNPhoneNumber* pn = contact.phoneNumbers.firstObject.value;
    MainManager.sharedInstance.phoneNumber = pn.stringValue;
    dispatch_async(dispatch_get_main_queue(), ^{
        self.phoneTextField.text = MainManager.sharedInstance.phoneNumber;
    });
    
    
}

@end
