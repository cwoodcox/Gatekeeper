//
//  GKLocationManagerDelegate.h
//  Gatekeeper
//
//  Created by Corey Woodcox on 5/19/13.
//  Copyright (c) 2013 spectful. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface GKLocationManager : NSObject <CLLocationManagerDelegate>

@property (weak, nonatomic)       UIApplication *application;
@property (strong, nonatomic) CLLocationManager *manager;
@property (strong, nonatomic)        CLLocation *homeLocation;

+(id) initWithApplication: (UIApplication *)application;
-(void) setHomeLocation;
-(CLRegion *) createHomeLocationRegion;

@end
