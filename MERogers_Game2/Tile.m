//
//  Tile.m
//  MERogers_Game2
//
//  Created by Max Rogers on 11/2/14.
//  Copyright (c) 2014 maxrogers. All rights reserved.
//

#import "Tile.h"

@implementation Tile
- (id) init
{
    self = [super init];
    if (self!=nil) {
        _x = 0;
        _y = 0;
        _width = 32;
        _height = 32
        ;
        _occupants = [NSMutableArray array];
    }
    return self;
}

- (id)initWithX:(int)x andY: (int)y andW: (int) w andH: (int)h
{
    self = [super init];
    if (self)
    {
        _x = x;
        _y = y;
        _width = w;
        _height = h;
        _occupants = [NSMutableArray array];
        printf("\n%i %i\n",_x/32,_y/32);
    }
    
    return self;
}

-(void) addOccupant:(id )object{
    [_occupants addObject: object];
    //NSLog(@"array: %@", _occupants);
}

-(void) animate{
    for (id object in _occupants){
        [object animate];
    }
}
-(void) linkTiles:( NSMutableArray *) tiles{
    _tiles = tiles;
}
@end
