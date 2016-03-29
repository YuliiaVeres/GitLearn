//
//  SecondViewController.m
//  LearnGit
//
//  Created by Yuliia Veresklia on 3/28/16.
//  Copyright © 2016 Yuliia Veresklia. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)__initialSetup
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    NSLog(@"Testing amend pushed commit :-D ");

    NSLog(@"Actual test");
}

- (void)__test_afterBranch_1_creation
{
    NSLog(@" ON Master *** after branch_1 implementation");
}

@end
