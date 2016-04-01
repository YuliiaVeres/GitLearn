//
//  ViewController.m
//  LearnGit
//
//  Created by Yuliia Veresklia on 3/28/16.
//  Copyright © 2016 Yuliia Veresklia. All rights reserved.
//

#import "ViewController.h"
#import <math.h>

const CGFloat officeLatitude = 53.3381985 * M_PI / 180.0;
const CGFloat officeLongitude = -6.2592576;

const CGFloat earthRadius = 6371.0;
const CGFloat acceptedRadius = 100.0;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self inviteClients];
}

- (void)calculateArray
{
    NSArray *first = @[@(1), @(2), @(3)];
    NSArray *second = @[first, @(4)];
    NSArray *third = @[@(6), @(7)];
    
    NSArray *arrayToTest = @[second, @(5), third, @(8)];
    
    NSArray *result = [self processArray:arrayToTest];
    
    NSLog(@"Result array: %@", result);
}

- (void)inviteClients
{
    NSString *requestUrl = @"https://gist.githubusercontent.com/brianw/19896c50afa89ad4dec3/raw/6c11047887a03483c50017c1d451667fd62a53ca/gistfile1.txt";
    
    NSURL *url = [NSURL URLWithString:requestUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    __weak typeof (self)weakSelf = self;
    [[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSString *clientsString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        clientsString = [clientsString stringByReplacingOccurrencesOfString:@"\n" withString:@","];
        clientsString = [NSString stringWithFormat:@"[%@]", clientsString];
        
        NSData *clientsData = [clientsString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *e = nil;
        
        NSArray *clients = [NSJSONSerialization JSONObjectWithData:clientsData options:0 error:&e];
        
        typeof(weakSelf)strongSelf = weakSelf;
        [strongSelf filterClientsWithinAcceptedDistance:clients];
        
    }] resume];
}

- (void)filterClientsWithinAcceptedDistance:(NSArray *)clients
{
    NSMutableArray *invitedClients = [NSMutableArray new];
    for (NSDictionary *client in clients)
    {
        if ([self isWithinAcceptedRadius:client])
            [invitedClients addObject:client];
    }
    
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"user_id" ascending:YES];
    [invitedClients sortUsingDescriptors:@[descriptor]];
    
    for (NSDictionary *client in invitedClients)
        NSLog(@"\nName: %@, user id : %@ \n", client[@"name"], client[@"user_id"]);
}

- (BOOL)isWithinAcceptedRadius:(NSDictionary *)client
{
    CGFloat latitude = [client[@"latitude"] floatValue];
    CGFloat latitudeRad = latitude * M_PI / 180.0;
    CGFloat longitude = [client[@"longitude"] floatValue];
    CGFloat longitudeDiff = fabs(officeLongitude - longitude) * M_PI / 180.0;
    
    CGFloat centralAngle = acos(sinf(latitudeRad) * sinf(officeLatitude) + cosf(latitudeRad) * cosf(officeLatitude) * cosf(longitudeDiff));
    CGFloat distance = centralAngle * earthRadius;
    NSLog(@"Distance: %f", distance);
    return distance <= acceptedRadius;
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

- (void)onMaster_1
{
    NSLog(@"Lets log before rebase");
}

- (void)onMaster_2
{
    NSLog(@"Second modif before rebase");
}

- (void)onClient_1_from_2_modif_1
{
    NSLog(@"First modif on secondary branch");
}

#pragma mark - Doing madiator's child work

- (void)doMediatorCHILDWork
{

}

- (void)doOtherCHILDWork
{

}

#pragma mark - Child job

- (void)__childJob_1
{

}

- (void)__childJob_2
{

}

@end
