//
//  GKAppDelegate.h
//  Gatekeeper
//
//  Created by Corey Woodcox on 5/19/13.
//  Copyright (c) 2013 spectful. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GKLocationManager;

@interface GKAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic)                  UIWindow *window;
@property (strong, nonatomic) GKLocationManager *locationManager;

@end
