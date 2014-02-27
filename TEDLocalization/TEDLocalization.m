//
//  TEDLocalization.m
//  TEDLocalization
//
//  Copyright (C) 2014 Technology eBay Germany
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "TEDLocalization.h"

#define Localize(value) NSLocalizedString(value, nil)

@implementation TEDLocalization

+ (void)localize:(UIViewController *)viewController
{
    if (viewController.navigationItem.title) {
        viewController.navigationItem.title = Localize(viewController.navigationItem.title);
        if (viewController.navigationItem.title.accessibilityLabel) {
            viewController.navigationItem.title.accessibilityLabel = Localize(viewController.navigationItem.title.accessibilityLabel);
        }
    } else {
        viewController.title = Localize(viewController.title);
        if (viewController.title.accessibilityLabel) {
            viewController.title.accessibilityLabel = Localize(viewController.title.accessibilityLabel);
        }
    }
    
    viewController.navigationItem.leftBarButtonItem.title = Localize(viewController.navigationItem.leftBarButtonItem.title);
    if (viewController.navigationItem.leftBarButtonItem.title.accessibilityLabel) {
        viewController.navigationItem.leftBarButtonItem.title.accessibilityLabel = Localize(viewController.navigationItem.leftBarButtonItem.title.accessibilityLabel);
    }
    
    viewController.navigationItem.rightBarButtonItem.title = Localize(viewController.navigationItem.rightBarButtonItem.title);
    if (viewController.navigationItem.rightBarButtonItem.title.accessibilityLabel) {
        viewController.navigationItem.rightBarButtonItem.title.accessibilityLabel = Localize(viewController.navigationItem.rightBarButtonItem.title.accessibilityLabel);
    }
    
    [self localizeView:viewController.view];
}

+ (void)localizeView:(UIView *)view
{
    if (view.accessibilityLabel) {
        view.accessibilityLabel = Localize(view.accessibilityLabel);
    }
    
    if ([view isKindOfClass:UIButton.class]) {
        [self localizeButton:(UIButton *)view];
    } else if ([view isKindOfClass:UILabel.class]) {
        [self localizeLabel:(UILabel *)view];
    } else if ([view isKindOfClass:UITextField.class]) {
        [self localizeTextField:(UITextField *)view];
    }
    
    for (UIView *subviews in view.subviews) {
        [self localizeView:subviews];
    }
}

+ (void)localizeButton:(UIButton *)button
{
    NSString *localizedText = Localize(button.currentTitle);
    NSString *currentText = [button titleForState:UIControlStateNormal];
    if (![currentText isEqualToString:localizedText]) {
        [button setTitle:localizedText forState:UIControlStateNormal];
    }
}

+ (void)localizeLabel:(UILabel *)label
{
    NSString *localizedText = Localize(label.text);
    if (![label.text isEqualToString:localizedText]) {
        label.text = localizedText;
    }
}

+ (void)localizeTextField:(UITextField *)textField
{
    NSString *localizedText = Localize(textField.text);
    if (![textField.text isEqualToString:localizedText]) {
        textField.text = localizedText;
    }
    
    NSString *localizedPlaceholder = Localize(textField.placeholder);
    if (![textField.placeholder isEqualToString:localizedPlaceholder]) {
        textField.placeholder = localizedPlaceholder;
    }
}

@end
