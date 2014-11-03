//
//  Wario.m
//  MERogers_Game
//
//  Created by Max Rogers on 10/30/14.
//  Copyright (c) 2014 maxrogers. All rights reserved.
//

#import "Wario.h"

@implementation Wario

- (id) init
{
    self = [super init];
    if (self!=nil) {
        _run_animation = @[@"wario_run_0.png", @"wario_run_1.png", @"wario_run_2.png", @"wario_run_3.png", @"wario_run_4.png", @"wario_run_5.png"];
        _animate_cursor = 0;
        _animation_name = @"run";
        _x = 250;
        _y = 160;
        _width = 90;
        _height = 90;
        _animating = false;
       _avatar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wario_default.png"]];
       _avatar.frame = CGRectMake(_x,_y,_width,_height);
        NSLog(@"Wario gonna win");
    }
    return self;
}

-(void) animate{
    if([_animation_name isEqualToString:@"run"]){
        if(_animate_cursor == 0){
            [_avatar setImage: [UIImage imageNamed:@"wario_run_0.png"]];
            _animate_cursor = 1;
        }else if(_animate_cursor == 1){
            [_avatar setImage: [UIImage imageNamed:@"wario_run_1.png"]];
            _animate_cursor = 2;
        }else if(_animate_cursor == 2){
            [_avatar setImage: [UIImage imageNamed:@"wario_run_2.png"]];
            _animate_cursor = 3;
        }else if(_animate_cursor == 3){
            [_avatar setImage: [UIImage imageNamed:@"wario_run_3.png"]];
            _animate_cursor = 4;
        }else if(_animate_cursor == 4){
            [_avatar setImage: [UIImage imageNamed:@"wario_run_4.png"]];
            _animate_cursor = 5;
        }else if(_animate_cursor == 5){
            [_avatar setImage: [UIImage imageNamed:@"wario_run_5.png"]];
            _animate_cursor = 0;
        }else{
            [_avatar setImage: [UIImage imageNamed:@"wario_default.png"]];
            _animate_cursor = 0;
        }
    }else if([_animation_name isEqualToString:@"jump"]){
        if(_animate_cursor < 10 ){
            _animating = true;
            [_avatar setImage: [UIImage imageNamed:@"wario_jump_0.png"]];
            if(_animate_cursor < 5){
                if(_animate_cursor > 3){
                    [_avatar setImage: [UIImage imageNamed:@"wario_jump_1.png"]];
                }else{
                    [_avatar setImage: [UIImage imageNamed:@"wario_jump_0.png"]];
                }
                [UIView animateWithDuration:0.5f animations:^{ _avatar.frame=CGRectMake(_avatar.frame.origin.x,_avatar.frame.origin.y-10,90,90);
                }];
            }else if(_animate_cursor >= 5 && _animate_cursor <= 10){
                if(_animate_cursor < 7){
                    [_avatar setImage: [UIImage imageNamed:@"wario_jump_1.png"]];
                }else{
                    [_avatar setImage: [UIImage imageNamed:@"wario_jump_0.png"]];
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
            [_avatar setImage: [UIImage imageNamed:@"wario_duck_0.png"]];
            _animate_cursor++;
            
            if(_animate_cursor == 5){
                _animate_cursor = 0;
                _animation_name = @"run";
            }
        }else{
            [_avatar setImage: [UIImage imageNamed:@"wario_default.png"]];
            _animate_cursor = 0;
        }
    }else if([_animation_name isEqualToString:@"attack"]){
        if(_animate_cursor < 5){
            [_avatar setImage: [UIImage imageNamed:@"wario_attack_0.png"]];
            _animate_cursor++;
            
            if(_animate_cursor == 5){
                _animate_cursor = 0;
                _animation_name = @"run";
            }
        }else{
            [_avatar setImage: [UIImage imageNamed:@"wario_default.png"]];
            _animate_cursor = 0;
        }

    }else{
        [_avatar setImage: [UIImage imageNamed:@"wario_default.png"]];
        _animate_cursor = 0;
    }
}
@end
