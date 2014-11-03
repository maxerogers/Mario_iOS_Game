//
//  Koopa.m
//  MERogers_Game2
//
//  Created by Max Rogers on 11/2/14.
//  Copyright (c) 2014 maxrogers. All rights reserved.
//

#import "Koopa.h"

@implementation Koopa

- (id)init{
    self = [super init];
    if (self)
    {
        _x = 0;
        _y = 160;
        _width = 32;
        _height = 32;
        _animate_cursor = 0;
        _avatar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"koopa_0.png"]];
        _avatar.frame = CGRectMake(_x,_y,_width,_height);
    }
    
    return self;
}
-(void) animate{
    if(_animate_cursor == 0){
        [_avatar setImage: [UIImage imageNamed:@"koopa_0.png"]];
    }else if(_animate_cursor == 1){
        [_avatar setImage: [UIImage imageNamed:@"koopa_1.png"]];
    }else if(_animate_cursor == 2){
        [_avatar setImage: [UIImage imageNamed:@"koopa_2.png"]];
    }else if(_animate_cursor == 3){
        [_avatar setImage: [UIImage imageNamed:@"koopa_3.png"]];
        _animate_cursor = -1;
    }
    [UIView animateWithDuration:0.5f animations:^{ _avatar.frame=CGRectMake(_avatar.frame.origin.x-10,_avatar.frame.origin.y,_width,_height);
    }];
    _animate_cursor++;
}

-(void) addtile:(Tile *)tile{
    _tile = tile;
    _avatar.frame = CGRectMake(_tile.x,_tile.y,_tile.width,_tile.height);
}

@end
