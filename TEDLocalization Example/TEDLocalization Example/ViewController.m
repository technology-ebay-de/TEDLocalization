//
//  ViewController.m
//  TEDLocalization Example
//
//  Created by Hoefele, Claus on 27.02.14.
//  Copyright (c) 2014 Technology eBay Germany. All rights reserved.
//

#import "ViewController.h"

#import "TEDLocalization.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [TEDLocalization localize:self];
}

@end
