//
//  GameOverViewController.h
//  MERogers_Game2
//
//  Created by Max Rogers on 12/2/14.
//  Copyright (c) 2014 maxrogers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameOverViewController : UIViewController
@property IBOutlet UILabel *yourScore;
@property IBOutlet UILabel *player1Score;
@property IBOutlet UILabel *player2Score;
@property IBOutlet UILabel *player3Score;
@property IBOutlet UILabel *player4Score;
@property IBOutlet UILabel *player5Score;
@property IBOutlet UILabel *player6Score;
@property IBOutlet UITextField *yourName;

@property NSString *playerName;
@property NSInteger *score;
-(IBAction)newGame:(id)sender;
@end
