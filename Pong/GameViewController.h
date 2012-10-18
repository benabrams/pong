//
//  ViewController.h
//  Pong
//
//  Created by Ben Abrams on 10/8/12.
//  Copyright (c) 2012 Ben Abrams. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Paddle;


@interface GameViewController : UIViewController <UIAlertViewDelegate>

//self.view.backgroundColor = [ViewController randomColor];

{
    //self.view.backgroundColor = [ViewController randomColor];
    IBOutlet Paddle* paddleViewLeft;
    IBOutlet Paddle* paddleViewRight;
    IBOutlet UIView* ballView;
    IBOutlet UILabel* oPlayerOneScore;
    IBOutlet UILabel* oPlayerTwoScore;
    IBOutlet UILabel* oCountDown;
    
    
    int                directionY;
    int                directionX;
    int                mPlayerOneScore;
    int                mPlayerTwoScore;
    int                mCountDown;
    
}

-(void)moveBall:(NSTimer*)timer;
-(void)startGame;
-(void)CountDown; //not neccessary 

@end
