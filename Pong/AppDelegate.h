//
//  AppDelegate.h
//  Pong
//
//  Created by Ben Abrams on 10/8/12.
//  Copyright (c) 2012 Ben Abrams. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WelcomeScreenViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) WelcomeScreenViewController *viewController;


@end
