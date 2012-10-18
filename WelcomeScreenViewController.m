//
//  WelcomeScreenViewController.m
//  Pong
//
//  Created by Ben Abrams on 10/17/12.
//  Copyright (c) 2012 Ben Abrams. All rights reserved.
//

#import "WelcomeScreenViewController.h"
#import "GameViewController.h"

@interface WelcomeScreenViewController ()

@end

@implementation WelcomeScreenViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
-(IBAction)playGame:(UIButton*)button
{
    NSLog(@"Play the game, fool!");
}
 */

-(IBAction)startGame:(id)sender
{
GameViewController* gameViewController = [[GameViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    gameViewController.view.alpha = 0.0f;
    [self.view addSubview:gameViewController.view];
    
    [UIView animateWithDuration:2.0
                     animations:^{
                         gameViewController.view.alpha = 1.0f;
                     }
                     completion:^(BOOL finished) {
                         [gameViewController startGame];
                     }];
}

@end
