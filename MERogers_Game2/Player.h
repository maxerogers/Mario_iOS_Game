//
//  Player.h
//  MERogers_Game2
//
//  Created by Max Rogers on 11/2/14.
//  Copyright (c) 2014 maxrogers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Tile.h"
@interface Player : NSObject
@property UIImageView *avatar;
@property int x;
@property int y;
@property int width;
@property int height;
@property NSString *state;
@property NSString *animation_name;
@property int animate_cursor;
@property BOOL animating;
@property NSString *character_name;
@property Tile *tile;
-(void) addtile:(Tile *)tile;
-(id) init;
- (id)initWithName:(NSString *)name;
-(void) animate;
@end
