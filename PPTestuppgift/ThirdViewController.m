//
//  ThirdViewController.m
//  PPTestuppgift
//
//  Created by Herber Peter on 15/08-16.
//  Copyright © 2016 Herber Peter. All rights reserved.
//

#import "ThirdViewController.h"
#import "App.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.phoneTextField.delegate = self;
    self.phoneTextField.keyboardType = UIKeyboardTypePhonePad;
    [self.phoneTextField setKeyboardDoneButtonWithText:NSLocalizedString(@"Done",nil)];
    self.callButton.enabled = NO;
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if(![MainManager.sharedInstance.phoneNumber isEqualToString:@""]) {
        self.phoneTextField.text = MainManager.sharedInstance.phoneNumber;
        self.callButton.enabled = YES;
    }
    
}

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if([self.phoneTextField.text isEqualToString:@""]) {
        self.callButton.enabled = NO;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void) textFieldDidEndEditing:(UITextField *)textField {
    self.callButton.enabled = ![textField.text isEqualToString:@""];
}
-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}


- (IBAction)callTapped:(id)sender {
    NSURL *phoneUrl = [NSURL URLWithString:[NSString  stringWithFormat:@"telprompt:%@",self.phoneTextField.text]];
    
    if ([[UIApplication sharedApplication] canOpenURL:phoneUrl]) {
        [[UIApplication sharedApplication] openURL:phoneUrl];
    } else
    {
        UIAlertController *ac = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Error calling",nil) message:NSLocalizedString(@"Dial up function missing!",nil) preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* ok = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK",nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //Do some thing here
            [ac dismissViewControllerAnimated:YES completion:nil];
        }];
        [ac addAction:ok];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:ac animated:YES completion:nil];
        });
        
    }
}
@end
