//
//  GKLocationManagerDelegate.m
//  Gatekeeper
//
//  Created by Corey Woodcox on 5/19/13.
//  Copyright (c) 2013 spectful. All rights reserved.
//

#import "GKAppDelegate.h"
#import "GKLocationManager.h"

@implementation GKLocationManager

+ (id)initWithApplication:(UIApplication *)application
{
    GKLocationManager *delegate = [[super alloc] init];
    delegate.application = application;
    
    delegate.manager = [[CLLocationManager alloc] init];
    delegate.manager.delegate = delegate;
    return delegate;
}

- (CLRegion *)createHomeLocationRegion
{
    return [[CLRegion alloc] initCircularRegionWithCenter:self.homeLocation.coordinate radius:100.0 identifier:@"Home Location Region"];
}

- (void)setHomeLocation
{
    [self.manager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region
{
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.alertBody = @"Welcome home! Shall we open the gate?";
    notification.alertAction = @"Open";
    [self.application presentLocalNotificationNow: notification];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = [locations lastObject];
    NSLog(@"Location accuracy is %2f", location.horizontalAccuracy);
    // If we don't have the desired accuracy, do nothing. We'll get called
    // again eventually with more accurateness.
    if (location.horizontalAccuracy < 10.0) {
        self.homeLocation = location;
        CLRegion *homeLocationRegion = [self createHomeLocationRegion];
        [self.manager stopUpdatingLocation];
        [self.manager startMonitoringForRegion:homeLocationRegion];
    }
}
@end
