//
//  GameView.h
//  MERogers_Game2
//
//  Created by Max Rogers on 11/2/14.
//  Copyright (c) 2014 maxrogers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mario.h"
#import "Luigi.h"
#import "Waluigi.h"
#import "Wario.h"
#import "Koopa.h"
#import "Tile.h"
#import "Brick.h"
#import "Player.h"
@interface GameView : UIViewController
@property NSMutableArray *bricks;
@property NSMutableArray *koopas;
@property NSMutableArray *tiles;
@property NSString *toon;
@property Wario *wario;
@property Mario *mario;
@property Waluigi *waluigi;
@property Luigi *luigi;
@property Player *player;
@property int score;
-(void) addPlayer:(NSString *)name;
@end
