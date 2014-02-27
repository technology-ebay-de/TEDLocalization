//
//  TEDLocalizationTests.m
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

#import <XCTest/XCTest.h>

@interface TEDLocalizationTests : XCTestCase

@end

@implementation TEDLocalizationTests

- (void)setUp
{
    [super setUp];
}

- (void)testViewControllerLocalization
{
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.navigationItem.title = @"NAV_Title";
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectZero];
    button.accessibilityLabel = @"SCREEN_Button";
    button.titleLabel.text = @"SCREEN_Button";
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.text = @"SCREEN_Label";
    label.accessibilityLabel = @"SCREEN_Label";
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectZero];
    textField.text = @"SCREEN_TextField";
    textField.placeholder = @"SCREEN_TextField";
    
    viewController.view = [[UIView alloc] initWithFrame:CGRectZero];
    [viewController.view addSubview:button];
    [viewController.view addSubview:label];
    [viewController.view addSubview:textField];
    
    [TEDLocalization localize:viewController];
    
    XCTAssertEqualObjects(viewController.navigationItem.title, @"Localized Title");
    XCTAssertEqualObjects(button.accessibilityLabel, @"Localized Button");
    XCTAssertEqualObjects(button.titleLabel.text, @"Localized Button");
    XCTAssertEqualObjects(textField.text, @"Localized Text Field");
    XCTAssertEqualObjects(textField.placeholder, @"Localized Text Field");
}

@end
