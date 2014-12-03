//
//  GameView.m
//  MERogers_Game2
//
//  Created by Max Rogers on 11/2/14.
//  Copyright (c) 2014 maxrogers. All rights reserved.
//

#import "GameView.h"
#import "GameOverViewController.h"
#import <AVFoundation/AVFoundation.h>

@implementation GameView
- (void)viewDidLoad {
    _flag = 10;
    [super viewDidLoad];
    [self setupTiles];
    [self setupPlayer];
    [self setupBaddies];
    [NSTimer scheduledTimerWithTimeInterval:0.5f
                                     target:self selector:@selector(animate:) userInfo:nil repeats:YES];
    // Construct URL to sound file
    NSString *path = [NSString stringWithFormat:@"%@/SuperMarioBros.mp3", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundUrl = [NSURL fileURLWithPath:path];
    
    // Create audio player object and initialize with URL to sound
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    //[_audioPlayer play];
    _score = 0;
    
    UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipe:)];
    swipeUp.direction = UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:swipeUp];
    
    // Construct URL to sound file
    NSString *path2 = [NSString stringWithFormat:@"%@/smw_coin.wav", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundUrl2 = [NSURL fileURLWithPath:path2];
    
    // Create audio player object and initialize with URL to sound
    _coinPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl2 error:nil];
    
    // Construct URL to sound file
    NSString *path3 = [NSString stringWithFormat:@"%@/smw_jump.wav", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundUrl3 = [NSURL fileURLWithPath:path3];
    
    // Create audio player object and initialize with URL to sound
    _jumpPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl3 error:nil];
}

-(void)setupTiles{
    _tiles = [NSMutableArray array];
    int numBrickColumns = 12;
    for(int i=0;i<numBrickColumns;i++){
        for(int j=0;j<4;j++){
            
            Tile *temp = [[Tile alloc] initWithX:i*64 andY:(j+2)*64 andW:64 andH:64];
            if(j == 2){
                Brick *brick  = [[Brick alloc] init];
                [brick changeType:@"grass"];
                [brick addtile:temp];
                [temp addOccupant: brick];
                
                [self.view addSubview: brick.avatar];
            }else if(j == 3){
                Brick *brick  = [[Brick alloc] init];
                [brick changeType:@"grass2"];
                [brick addtile:temp];
                [temp addOccupant: brick];
                [self.view addSubview: brick.avatar];
            }
            temp.index = (i*4)+j;
            [_tiles addObject:temp];
            temp.tiles = _tiles;
            //NSLog(@"%d => %d",(i*4)+j, temp.index);
        }
    }
    //Tile *temp = [_tiles objectAtIndex:(3*4)+3];
    //NSLog(@"%d => %d",(3*4)+3, temp.index);
}

-(void)addPlayer:(NSString *)name{
    if([name isEqualToString:@"waluigi"]){
        _player = [[Player alloc ]initWithName:@"waluigi"];
    }else if([name isEqualToString:@"wario"]){
        _player = [[Player alloc ]initWithName:@"wario"];
    }else if([name isEqualToString:@"luigi"]){
        _player = [[Player alloc ]initWithName:@"luigi"];
    }else{
        _player = [[Player alloc ]initWithName:@"mario"];
    }
}

-(void) setupPlayer{
    Tile *tile = [_tiles objectAtIndex:5];
    [tile addOccupant:_player];
    [_player addtile:tile];
    [self.view addSubview:_player.avatar];
}

-(void) setupBaddies{
    Tile *tile = [_tiles objectAtIndex:45];
    Koopa *koopa = [[Koopa alloc] init];
    [koopa addtile: tile];
    [tile addOccupant: koopa];
    [self.view addSubview:koopa.avatar];
}

-(void) animate:(NSTimer *)timer{
    for(Tile *tile in _tiles){
        
        if(tile.index == 5 && _flag > 0){
            if([[[tile occupants] firstObject] class] == [Player class] && [[tile occupants] count] > 1){
                NSLog(@"HIT");
                if([_player.animation_name isEqualToString:@"jump"]){
                    NSLog(@"Nice Jump Mario");
                    _score += 100;
                    [_coinPlayer play];
                }else{
                    //Do Game Over Stuff
                    [_audioPlayer stop];
                    
                    _flag = -10;
                    
                    GameOverViewController *gameOverVC = (GameOverViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"GameOverViewController"];
                    gameOverVC.playerName = _player.character_name;
                    gameOverVC.score = _score;
                    [self presentViewController:gameOverVC animated:YES completion:nil];
                }
            }
        }
        
        [tile animate];
    }
    
    Tile *temp = [_tiles objectAtIndex:[_tiles count]-2];
    Brick *brick  = [[Brick alloc] init];
    [brick changeType:@"grass"];
    [brick addtile:temp];
    [temp addOccupant: brick];
    [self.view addSubview: brick.avatar];
    
    temp = [_tiles objectAtIndex:[_tiles count]-1];
    brick  = [[Brick alloc] init];
    [brick changeType:@"grass2"];
    [brick addtile:temp];
    [temp addOccupant: brick];
    [self.view addSubview: brick.avatar];
    
    _score += 30;
    
    if((arc4random() % 16) < 4){
        [self setupBaddies];
    }
    _scoreLabel.text = [NSString stringWithFormat:@"Score: %d",_score];
}


- (void)didSwipe:(UISwipeGestureRecognizer*)swipe{
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
        NSLog(@"Swipe Left");
    } else if (swipe.direction == UISwipeGestureRecognizerDirectionRight) {
        if(_player.animating == false){
            NSLog(@"Swipe Right");
            _player.animation_name = @"attack";
            _player.state = @"attack";
        }
    } else if (swipe.direction == UISwipeGestureRecognizerDirectionUp) {
        if(_player.animating == false){
            NSLog(@"Swipe Up");
             _player.animation_name = @"jump";
             _player.animate_cursor = 0;
            [_jumpPlayer play];
        }
    } else if (swipe.direction == UISwipeGestureRecognizerDirectionDown) {
        if(_player.animating == false){
            NSLog(@"Swipe Down");
            // _player.animation_name = @"duck";
        }
    }
}

@end
