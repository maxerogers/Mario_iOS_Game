//
//  Mario.m
//  MERogers_Game
//
//  Created by Max Rogers on 11/1/14.
//  Copyright (c) 2014 maxrogers. All rights reserved.
//

#import "Mario.h"

@implementation Mario

- (id) init
{
    self = [super init];
    if (self!=nil) {
        _run_animation = @[@"mario_run_0.png", @"mario_run_1.png", @"mario_run_2.png", @"mario_run_3.png", @"mario_run_4.png", @"mario_run_5.png"];
        _animate_cursor = 0;
        _animation_name = @"run";
        _x = 0;
        _y = 160;
        _width = 90;
        _height = 90;
        _animating = false;
        _avatar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mario_default.png"]];
        _avatar.frame = CGRectMake(_x,_y,_width,_height);
        NSLog(@"Its a me Mario");
    }
    return self;
}

-(void) animate{
    if([_animation_name isEqualToString:@"run"]){
        if(_animate_cursor == 0){
            [_avatar setImage: [UIImage imageNamed:@"mario_run_0.png"]];
            _animate_cursor = 1;
        }else if(_animate_cursor == 1){
            [_avatar setImage: [UIImage imageNamed:@"mario_run_1.png"]];
            _animate_cursor = 2;
        }else if(_animate_cursor == 2){
            [_avatar setImage: [UIImage imageNamed:@"mario_run_2.png"]];
            _animate_cursor = 3;
        }else if(_animate_cursor == 3){
            [_avatar setImage: [UIImage imageNamed:@"mario_run_3.png"]];
            _animate_cursor = 4;
        }else if(_animate_cursor == 4){
            [_avatar setImage: [UIImage imageNamed:@"mario_run_4.png"]];
            _animate_cursor = 5;
        }else if(_animate_cursor == 5){
            [_avatar setImage: [UIImage imageNamed:@"mario_run_5.png"]];
            _animate_cursor = 0;
        }else{
            [_avatar setImage: [UIImage imageNamed:@"mario_default.png"]];
            _animate_cursor = 0;
        }
    }else if([_animation_name isEqualToString:@"jump"]){
        if(_animate_cursor < 10 ){
            _animating = true;
            [_avatar setImage: [UIImage imageNamed:@"mario_jump_0.png"]];
            if(_animate_cursor < 5){
                if(_animate_cursor > 3){
                    [_avatar setImage: [UIImage imageNamed:@"mario_jump_1.png"]];
                }else{
                    [_avatar setImage: [UIImage imageNamed:@"mario_jump_0.png"]];
                }
                [UIView animateWithDuration:0.5f animations:^{ _avatar.frame=CGRectMake(_avatar.frame.origin.x,_avatar.frame.origin.y-10,90,90);
                }];
            }else if(_animate_cursor >= 5 && _animate_cursor <= 10){
                if(_animate_cursor < 7){
                    [_avatar setImage: [UIImage imageNamed:@"mario_jump_1.png"]];
                }else{
                    [_avatar setImage: [UIImage imageNamed:@"mario_jump_0.png"]];
                }
                
                [UIView animateWithDuration:0.5f animations:^{ _avatar.frame=CGRectMake(_avatar.frame.origin.x,_avatar.frame.origin.y+10,90,90);
                }];
            }else{
                //
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
@end

