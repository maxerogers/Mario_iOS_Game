//
//  Player.m
//  MERogers_Game2
//
//  Created by Max Rogers on 11/2/14.
//  Copyright (c) 2014 maxrogers. All rights reserved.
//

#import "Player.h"

@implementation Player
- (id)init{
    self = [super init];
    if (self)
    {
        
        _x = 0;
        _y = 160;
        _width = 32;
        _height = 32;
        _character_name = @"mario";
        _animate_cursor = 0;
        _animation_name = @"run";
        _animating = false;
        _state = @"running";
        _avatar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mario_default.png"]];
        _avatar.frame = CGRectMake(_x,_y,_width,_height);
    }
    
    return self;
}
- (id)initWithName:(NSString *)name{
    self = [super init];
    if (self)
    {
        
        _x = 0;
        _y = 8*32;
        _width = 32;
        _height = 32;
        _character_name = name;
        _animate_cursor = 0;
        _animation_name = @"run";
        _animating = false;
        if([_character_name isEqualToString:@"mario"]){
            _avatar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mario_default.png"]];
        }
        if([_character_name isEqualToString:@"wario"]){
            _avatar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wario_default.png"]];
        }
        if([_character_name isEqualToString:@"luigi"]){
            _avatar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"luigi_default.png"]];
        }
        if([_character_name isEqualToString:@"waluigi"]){
            _avatar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"waluigi_default.png"]];
        }
        _avatar.frame = CGRectMake(_x,_y,_width,_height);
    }
    
    return self;
}
-(void) animate{
    //NSLog(@"DANCE BITCH");
    if([_animation_name isEqualToString:@"run"]){
        if(_animate_cursor == 0){
            [_avatar setImage: [UIImage imageNamed:[NSString stringWithFormat:@"%@_run_0.png",_character_name]]];
            _animate_cursor = 1;
        }else if(_animate_cursor == 1){
            [_avatar setImage: [UIImage imageNamed:[NSString stringWithFormat:@"%@_run_1.png",_character_name]]];
            _animate_cursor = 2;
        }else if(_animate_cursor == 2){
            [_avatar setImage: [UIImage imageNamed:[NSString stringWithFormat:@"%@_run_2.png",_character_name]]];
            _animate_cursor = 3;
        }else if(_animate_cursor == 3){
            [_avatar setImage: [UIImage imageNamed:[NSString stringWithFormat:@"%@_run_3.png",_character_name]]];
            _animate_cursor = 4;
        }else if(_animate_cursor == 4){
            [_avatar setImage: [UIImage imageNamed:[NSString stringWithFormat:@"%@_run_4.png",_character_name]]];
            _animate_cursor = 5;
        }else if(_animate_cursor == 5){
            [_avatar setImage: [UIImage imageNamed:[NSString stringWithFormat:@"%@_run_5.png",_character_name]]];
            _animate_cursor = 0;
        }else{
            [_avatar setImage: [UIImage imageNamed:[NSString stringWithFormat:@"%@_default.png",_character_name]]];
            _animate_cursor = 0;
        }
    }else if([_animation_name isEqualToString:@"jump"]){
        if(_animate_cursor < 2){
            [_avatar setImage: [UIImage imageNamed:[NSString stringWithFormat:@"%@_jump_0.png", _character_name]]];
            //[_avatar setImage: [UIImage imageNamed:@"mario_jump_0.png"]];
            if(_animate_cursor < 1){
                [UIView animateWithDuration:1.0f animations:^{ _avatar.frame=CGRectMake(_avatar.frame.origin.x,_avatar.frame.origin.y-64,_tile.width,_tile.height);
                }];
            }else {
                [UIView animateWithDuration:1.0f animations:^{ _avatar.frame=CGRectMake(_avatar.frame.origin.x,_avatar.frame.origin.y+64,_tile.width,_tile.height);
                }];
            }
            _animate_cursor++;
            NSLog(@"%d",_animate_cursor);
        }else{
            //[_avatar setImage: [UIImage imageNamed:@"wario_default.png"]];
            _animate_cursor = 0;
            _animation_name = @"run";
            _animating = false;
        }
    }else if([_animation_name isEqualToString:@"duck"]){
        if(_animate_cursor < 5){
            [_avatar setImage: [UIImage imageNamed:@"mario_duck_0.png"]];
            _animate_cursor++;
            
            if(_animate_cursor == 5){
                _animate_cursor = 0;
                _animation_name = @"run";
            }
        }else{
            [_avatar setImage: [UIImage imageNamed:@"mario_default.png"]];
            _animate_cursor = 0;
        }
    }else if([_animation_name isEqualToString:@"attack"]){
        if(_animate_cursor < 5){
            [_avatar setImage: [UIImage imageNamed:@"mario_attack_0.png"]];
            _animate_cursor++;
            
            if(_animate_cursor == 5){
                _animate_cursor = 0;
                _animation_name = @"run";
                _state = @"running";
            }
        }else{
            [_avatar setImage: [UIImage imageNamed:@"mario_default.png"]];
            _animate_cursor = 0;
        }
        
    }else{
        [_avatar setImage: [UIImage imageNamed:@"mario_default.png"]];
        _animate_cursor = 0;
    }
}
-(void) addtile:(Tile *)tile{
    _tile = tile;
    _avatar.frame = CGRectMake(_tile.x,_tile.y,_tile.width,_tile.height);
}
@end
