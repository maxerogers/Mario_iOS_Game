//
//  GameView.m
//  MERogers_Game2
//
//  Created by Max Rogers on 11/2/14.
//  Copyright (c) 2014 maxrogers. All rights reserved.
//

#import "GameView.h"

@implementation GameView
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _score = 0;
    //Load the background
    UIImageView *lvl_background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"smw-bg-hills.png"]];
    lvl_background.frame = CGRectMake(0,0,550*1.30,224*1.30);
    [self.view addSubview:lvl_background];
    
    // Do any additional setup after loading the view, typically from a nib.
    [self setUpTiles];
    [NSTimer scheduledTimerWithTimeInterval:0.25f
                                     target:self selector:@selector(animate:) userInfo:nil repeats:YES];
    
    [self setUpBaddies];
    
    // Added Swipe Gestures
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipe:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self  action:@selector(didSwipe:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRight];
    
    UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc]  initWithTarget:self action:@selector(didSwipe:)];
    swipeUp.direction = UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:swipeUp];
    
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipe:)];
    swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:swipeDown];
     
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) addPlayer:(NSString *)name{
    _player = [[Player alloc] initWithName:name];
    [self.view addSubview: _player.avatar];
    Tile *tile = [_tiles objectAtIndex: 6];
    [tile addOccupant:_player];
    [_player addtile: tile];
}

-(void) setUpTiles{
    _tiles = [NSMutableArray array];
    for(int i=0;i<100;i++){
        for(int j=0;j<10;j++){
            //NSLog(@"\n%f %f\n",(float)(i*32.0),(float)(j*32.0));
            //printf("\n%i %i\n",32*i,32*j);
            Tile *temp = [[Tile alloc] initWithX:32*i andY:32*(j+2) andW:32 andH:32];
            if(j == 7){
                Brick *brick = [[Brick alloc] init];
                [brick addtile: temp];
                [temp addOccupant:brick];
                [brick changeType:@"grass"];
                [self.view addSubview: brick.avatar];
            }else if(j > 7){
                Brick *brick = [[Brick alloc] init];
                [brick addtile: temp];
                [temp addOccupant:brick];
                [brick changeType:@"grass2"];
                [self.view addSubview: brick.avatar];
            }
            [_tiles addObject: temp];
            [temp linkTiles:_tiles];
            temp.index = i*10 + j;
        }
    }
}

- (void) animate:(NSTimer *)timer{
    int i = 0;
    for(Tile *tile in _tiles){
        [tile animate];
        //printf("\n%i\n",i);
        i++;
    }
    _score++;
}

- (void) brickFloor{
    for(int i=0;i<100;i++){
        UIImageView *dot =[[UIImageView alloc] initWithFrame:CGRectMake(i*35,250,35,35)];
        dot.image=[UIImage imageNamed:@"brick.png"];
        [self.view addSubview:dot];
        [_bricks addObject:dot];
    }
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
           // _player.animation_name = @"jump";
           // _player.animate_cursor = 0;
        }
    } else if (swipe.direction == UISwipeGestureRecognizerDirectionDown) {
        if(_player.animating == false){
            NSLog(@"Swipe Down");
           // _player.animation_name = @"duck";
        }
    }
}

-(void)setUpBaddies{
    Koopa *new_koopa = [[Koopa alloc] init];
    [self.view addSubview: new_koopa.avatar];
    Tile *tile = [_tiles objectAtIndex: 46];
    [tile addOccupant:new_koopa];
    [new_koopa addtile:tile];
    
}


@end
