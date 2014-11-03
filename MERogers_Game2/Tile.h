//
//  Tile.h
//  MERogers_Game2
//
//  Created by Max Rogers on 11/2/14.
//  Copyright (c) 2014 maxrogers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tile : NSObject
@property int x;
@property int y;
@property int width;
@property int height;
@property int index;
@property NSMutableArray *occupants;
@property NSMutableArray *tiles;
- (id)initWithX:(int)x andY: (int)y andW: (int) w andH: (int)h;
- (id)init;
-(void) animate;
-(void) addOccupant:(id )object;
-(void) linkTiles:( NSMutableArray *) tiles;
@end
