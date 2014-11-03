//
//  Brick.h
//  MERogers_Game2
//
//  Created by Max Rogers on 11/2/14.
//  Copyright (c) 2014 maxrogers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Tile.h"
@interface Brick : NSObject
@property UIImageView *avatar;
@property NSString *type;
@property Tile *tile;
-(void) addtile:(Tile *)tile;
-(void) animate;
-(void) changeType:(NSString *)type;
@end
