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

- (void)__test_branch1_method
{
    NSLog(@"ON Branch_1 *** Tested log ammend 1 branch test method commit");
}

#pragma mark - Editing second view controller from Second Client

- (void)secondClientMethod
{

}

#pragma mark - Modifying this controller from 1 client on 2 client_branch

- (void)firstClientInSecondBranch
{

}

@end
