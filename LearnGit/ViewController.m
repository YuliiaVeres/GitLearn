//
//  ViewController.m
//  LearnGit
//
//  Created by Yuliia Veresklia on 3/28/16.
//  Copyright © 2016 Yuliia Veresklia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *first = @[@(1), @(2), @(3)];
    NSArray *second = @[first, @(4)];
    NSArray *third = @[@(6), @(7)];
    
    NSArray *arrayToTest = @[second, @(5), third, @(8)];
    
    NSArray *result = [self processArray:arrayToTest];
    
    NSLog(@"Result array: %@", result);
}

#pragma mark - Test task attempt

- (NSArray *)processArray:(NSArray *)elementsArray
{
    NSMutableArray *resultArray = [NSMutableArray new];
    
    for (id element in elementsArray)
    {
        if ([element isKindOfClass:[NSArray class]])
        {
            NSArray *arrayResults = [self processArray:element];
            [resultArray addObjectsFromArray:arrayResults];
        }
        else
            [resultArray addObject:element];
    }
    
    return resultArray.copy;
}

#pragma mark - Parent job

- (void)__parentJob_1
{

}

@end
