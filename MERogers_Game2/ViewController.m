//
//  ViewController.m
//  MERogers_Game2
//
//  Created by Max Rogers on 11/2/14.
//  Copyright (c) 2014 maxrogers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self loadAvatars];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)loadAvatars{
    _wario = [[Wario alloc] init];
    [self.view addSubview: _wario.avatar];
    
    _mario = [[Mario alloc] init];
    [self.view addSubview: _mario.avatar];
    
    _luigi = [[Luigi alloc] init];
    [self.view addSubview: _luigi.avatar];
    
    _waluigi = [[Waluigi alloc] init];
    [self.view addSubview: _waluigi.avatar];
    
    //Add Avatar Taps
    UITapGestureRecognizer *marioTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(marioSelected)];
    marioTap.numberOfTapsRequired = 1;
    [_mario.avatar setUserInteractionEnabled:YES];
    [_mario.avatar addGestureRecognizer:marioTap];
    
    UITapGestureRecognizer *warioTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(warioSelected)];
    warioTap.numberOfTapsRequired = 1;
    [_wario.avatar setUserInteractionEnabled:YES];
    [_wario.avatar addGestureRecognizer:warioTap];
    
    UITapGestureRecognizer *luigiTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(luigiSelected)];
    luigiTap.numberOfTapsRequired = 1;
    [_luigi.avatar setUserInteractionEnabled:YES];
    [_luigi.avatar addGestureRecognizer:luigiTap];
    
    UITapGestureRecognizer *waluigiTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(waluigiSelected)];
    waluigiTap.numberOfTapsRequired = 1;
    [_waluigi.avatar setUserInteractionEnabled:YES];
    [_waluigi.avatar addGestureRecognizer:waluigiTap];
}

//Character Selection
-(void)marioSelected{
    NSLog(@"\nMario Selected");
    GameView *gameView = (GameView *)[self.storyboard instantiateViewControllerWithIdentifier:@"GameView"];
    //gameView.toon = @"mario";
    //NSLog(@"%@",gameView.toon);
    [gameView addPlayer:@"mario"];
    [self presentViewController:gameView animated:YES completion:nil];
    //NSLog(@"\nGame View");
}

-(void)warioSelected{
    NSLog(@"\nWario Selected");
    GameView *gameView = (GameView *)[self.storyboard instantiateViewControllerWithIdentifier:@"GameView"];
    [gameView addPlayer:@"wario"];
    [self presentViewController:gameView animated:YES completion:nil];
    
}

-(void)luigiSelected{
    NSLog(@"\nLugi Selected");
    GameView *gameView = (GameView *)[self.storyboard instantiateViewControllerWithIdentifier:@"GameView"];
    [gameView addPlayer:@"luigi"];
    [self presentViewController:gameView animated:YES completion:nil];
    
}

-(void)waluigiSelected{
    NSLog(@"\nWaluigi Selected");
    GameView *gameView = (GameView *)[self.storyboard instantiateViewControllerWithIdentifier:@"GameView"];
    [gameView addPlayer:@"waluigi"];
    [self presentViewController:gameView animated:YES completion:nil];
    
}

@end
