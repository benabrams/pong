//
//  ViewController.m
//  Pong
//
//  Created by Ben Abrams on 10/8/12.
//  Copyright (c) 2012 Ben Abrams. All rights reserved.
//

#import "GameViewController.h"
#import "Paddle.h"
//#import "Constants.h"

@interface GameViewController ()


@end

@implementation GameViewController

- (void)viewDidLoad
{
    //self.view.backgroundColor = [ViewController randomColor];
    [super viewDidLoad];
    
    mCountDown = 2;
    
    
    //[paddleRight startMoving];
	// Do any additional setup after loading the view, typically from a nib.
    ballView.center = self.view.center;
     directionX = directionY = 1;
    
    mPlayerOneScore = mPlayerTwoScore = 0;
    
    oPlayerOneScore.text = [NSString stringWithFormat:@"%i", mPlayerOneScore]; //sets label to equal score
    oPlayerTwoScore.text = [NSString stringWithFormat:@"%i", mPlayerTwoScore]; // sets label to equal score
    
    //[self startTimer];
    
    oPlayerOneScore.font = [UIFont fontWithName:@"SFAtarianSystem" size:43];
    oPlayerTwoScore.font = [UIFont fontWithName:@"SFAtarianSystem" size:43];
    oCountDown.font = [UIFont fontWithName:@"SFAtarianSystem" size:43];
    
    ballView.alpha = 0.0f;
    oCountDown.alpha = 1.0f;
}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight || interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

-(void)startGame
{
    oCountDown.text = [NSString stringWithFormat:@"%i", mCountDown];
    [self startCountdownTimer];
}

-(void)resetGame
{
    mPlayerOneScore = mPlayerTwoScore = 0;
    oPlayerOneScore.text = @"0";
    oPlayerTwoScore.text = @"0";
    [self resetBall:nil];
}


-(void)countDown:(NSTimer*)timer
{
    mCountDown--;

    if (mCountDown < 0) {
    [timer invalidate];
    ballView.alpha = 1.0f;
    oCountDown.alpha = 0.0f;
    paddleViewRight.autoPlay = YES;
    [self startGameTimer];


}
else{
        oCountDown.text = [NSString stringWithFormat:@"%i", mCountDown];
    }
}



-(void)resetBall:(NSTimer*)timer

{
    [timer invalidate];
    //ballView.center = self.view.center; //this is the line
    if (mPlayerTwoScore >= 1) {
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Win"
                                  messsage:@"Someone lost"
                                  delegate:self
                                  cancelButtonTitle:@"No thanks"
                                  otherButtonTitles:@"Bring it!", nil];
        [alertView show];
        [alertView release];
    }
    else{
        ballView.center = self.view.center;
        directionY *= -1;
        directionX *= -1;
        [self startTimer];
    }
}
     
-(void)moveBall:(NSTimer*)timer

{
    if ((ballView.frame.origin.y + ballView.frame.size.width > self.view.frame.size.height) ||
     (ballView.frame.origin.y < 0))
    {
        directionY *= -1;
    }
    
    
    if (ballView.frame.origin.x + ballView.frame.size.height > self.view.frame.size.width){
        [self resetBall:timer];
        mPlayerTwoScore++;
        oPlayerTwoScore.text = [NSString stringWithFormat:@"%i", mPlayerOneScore];
    }
    else if(ballView.frame.origin.x < 0){
        [self resetBall:timer];
        mPlayerTwoScore++;
        oPlayerTwoScore.text = [NSString stringWithFormat:@"%i", mPlayerTwoScore];
    }
    
    if (CGRectIntersectsRect(ballView.frame, paddleViewLeft.frame)){
        directionX *= -1;
        directionY *= -1;
    }
    else if (CGRectIntersectsRect(ballView.frame, paddleViewRight.frame)) {
        directionX *= -1;
        directionY *= -1;
    }
    
    ballView.center = CGPointMake(ballView.center.x + directionX, ballView.center.y + directionY);
}

-(void)startTimer
{
    [NSTimer scheduledTimerWithTimeInterval:0.005f target:self selector:@selector(moveBall:) userInfo:nil repeats:YES];
}

-(void)startGameTimer
{
    [NSTimer scheduledTimerWithTimeInterval:0.005f target:self selector:@selector(moveBall:) userInfo:nil repeats:YES];
}

-(void)startCountdownTimer
{
    [NSTimer scheduledTimerWithTimeInterval:1.0f   target:self selector:@selector(countDown:) userInfo:nil repeats:YES];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            [self.view removeFromSuperview];
            break;
            
        case 1:
            [self resetGame];
        default:
            break;
    }
}
     
     
@end












