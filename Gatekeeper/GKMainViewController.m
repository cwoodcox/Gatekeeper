//
//  GKMainViewController.m
//  Gatekeeper
//
//  Created by Corey Woodcox on 5/19/13.
//  Copyright (c) 2013 spectful. All rights reserved.
//

#import "GKAppDelegate.h"
#import "GKMainViewController.h"
#import "GKLocationManager.h"

@interface GKMainViewController ()

@end

@implementation GKMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(20.0f, 20.0f, 280.0f, 40.0f);
    [button setTitle:@"Set Home Location" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: button];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonPressed
{
    // Something like [locationManager setHomeLocation]
    // but I need to get to the AppDelegate. HOW?
    GKAppDelegate *application = (GKAppDelegate *) [UIApplication sharedApplication].delegate;
    [application.locationManager setHomeLocation];
}
@end
