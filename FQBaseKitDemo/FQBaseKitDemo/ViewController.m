//
//  ViewController.m
//  FQBaseKit
//
//  Created by mac on 2019/1/16.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "ViewController.h"
#import "FQBaseHeader.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FQTextView *textview = [[FQTextView alloc]initWithFrame:CGRectMake(50, 100, self.view.bounds.size.width - 100, 50)];
    textview.layer.borderColor = [UIColor lightGrayColor].CGColor;
    textview.layer.borderWidth = 1;
    [self.view addSubview:textview];
}


@end
