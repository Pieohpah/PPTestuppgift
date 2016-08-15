//
//  UITextField+Additions.m
//  JenaCustomerTool
//
//  Created by Herber Peter on 24/02-16.
//  Copyright © 2016 Herber Peter. All rights reserved.
//

#import "UITextField+Additions.h"

@implementation UITextField (Additions)

- (void) setKeyboardDoneButtonWithText:(NSString*) string {
    UIToolbar *keyboardDoneButtonView = [[UIToolbar alloc] init];
    [keyboardDoneButtonView sizeToFit];
    UIBarButtonItem *flexBarButton = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                      target:nil action:nil];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:string
                                                                   style:UIBarButtonItemStylePlain target:self
                                                                  action:@selector(doneClicked:)];
    [keyboardDoneButtonView setItems:[NSArray arrayWithObjects:flexBarButton,doneButton, nil]];
    self.inputAccessoryView = keyboardDoneButtonView;
}

- (void) doneClicked:(id)sender
{
    if(self.delegate && [self.delegate respondsToSelector:@selector(textFieldShouldReturn:)]) {
        [self.delegate textFieldShouldReturn:self];
        return;
    }
    if(self.delegate && [self.delegate respondsToSelector:@selector(textFieldDidEndEditing:)]) {
        [self.delegate textFieldDidEndEditing:self];
        return;
    }
    [self resignFirstResponder];
}


@end
