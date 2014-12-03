//
//  Brick.m
//  MERogers_Game2
//
//  Created by Max Rogers on 11/2/14.
//  Copyright (c) 2014 maxrogers. All rights reserved.
//

#import "Brick.h"

@implementation Brick
- (id) init
{
    self = [super init];
    if (self!=nil) {
        _avatar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"brick.png"]];
    }
    return self;
}
-(void) changeType:(NSString *)type{
    if([type isEqualToString:@"grass"]){
        [_avatar setImage:[UIImage imageNamed:@"grass.png"]];
    }else if([type isEqualToString:@"grass2"]){
        [_avatar setImage:[UIImage imageNamed:@"grass2.png"]];
    }else{
        [_avatar setImage:[UIImage imageNamed:@"brick.png"]];
    }
    
}
-(void) addtile:(Tile *)tile{
    _tile = tile;
    _avatar.frame = CGRectMake(_tile.x,_tile.y,_tile.width,_tile.height);
}
-(void) animate{
    [UIView animateWithDuration:0.5f animations:^{ _avatar.frame=CGRectMake(_avatar.frame.origin.x-64,_avatar.frame.origin.y,_tile.width,_tile.height);
    }];
    if(_tile.index < 4){
        //NSLog(@"I am going off screen");
        [_tile.occupants removeObject:self];
        _tile = nil;
        //can't seem to add self back to last tile...so made a hackpatch in animation loop
        
    }else{
        //NSLog(@"WE ARE MOVING %d", _tile.index);
        [_tile.occupants removeObject:self];
        _tile = [_tile.tiles  objectAtIndex:_tile.index-4];
        [_tile addOccupant: self];
        //NSLog(@"SEE NOW IT IS %d", _tile.index);
    }
}
@end
