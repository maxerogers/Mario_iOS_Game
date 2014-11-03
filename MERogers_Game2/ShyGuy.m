//
//  ShyGuy.m
//  MERogers_Game2
//
//  Created by Max Rogers on 11/2/14.
//  Copyright (c) 2014 maxrogers. All rights reserved.
//

#import "ShyGuy.h"

@implementation ShyGuy

- (id) init
{
    self = [super init];
    if (self!=nil) {
        _animation_cursor = 0;
        _x = 200;
        _y = 160;
        _width = 90;
        _height = 90;
        _avatar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"koopa_0.png"]];
        _avatar.frame = CGRectMake(_x,_y,_width,_height);
    }
    return self;
}
-(void) animate{
    if(_animation_cursor == 0){
        [_avatar setImage: [UIImage imageNamed:@"koopa_0.png"]];
    }else if(_animation_cursor == 1){
        [_avatar setImage: [UIImage imageNamed:@"koopa_1.png"]];
    }else if(_animation_cursor == 2){
        [_avatar setImage: [UIImage imageNamed:@"koopa_2.png"]];
    }else if(_animation_cursor == 3){
        [_avatar setImage: [UIImage imageNamed:@"koopa_3.png"]];
        _animation_cursor = -1;
    }
    [UIView animateWithDuration:0.5f animations:^{ _avatar.frame=CGRectMake(_avatar.frame.origin.x-10,_avatar.frame.origin.y,90,90);
    }];
    _animation_cursor++;
    NSLog(@"MOVE TURTLE %f %f", _avatar.frame.origin.x, _avatar.frame.origin.y);
}

@end
