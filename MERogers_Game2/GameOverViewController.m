//
//  GameOverViewController.m
//  MERogers_Game2
//
//  Created by Max Rogers on 12/2/14.
//  Copyright (c) 2014 maxrogers. All rights reserved.
//

#import "GameOverViewController.h"
#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface GameOverViewController (){
    AVAudioPlayer *_audioPlayer;
    NSDictionary *_scores;
}

@end

@implementation GameOverViewController

-(IBAction)newGame:(id)sender{
    [self saveYourScore];
    
    ViewController *characterSelect = (ViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"CharacterSelect"];
    [self presentViewController:characterSelect animated:YES completion:nil];
}

-(void) saveYourScore{
    NSUserDefaults* preferences = [NSUserDefaults standardUserDefaults];
    if ([preferences objectForKey:@"score1"]< [NSNumber numberWithInt:_score]){
        [preferences setObject: [preferences objectForKey:@"score1" ] forKey:@"score2"];
        [preferences setObject: [preferences objectForKey:@"score2" ] forKey:@"score3"];
        [preferences setObject: [preferences objectForKey:@"score3" ] forKey:@"score4"];
        [preferences setObject: [preferences objectForKey:@"score4" ] forKey:@"score5"];
        [preferences setObject: [preferences objectForKey:@"score5" ] forKey:@"score6"];
        
        [preferences setObject: [preferences objectForKey:@"player1" ] forKey:@"player2"];
        [preferences setObject: [preferences objectForKey:@"player2" ] forKey:@"player3"];
        [preferences setObject: [preferences objectForKey:@"player3" ] forKey:@"player4"];
        [preferences setObject: [preferences objectForKey:@"player4" ] forKey:@"player5"];
        [preferences setObject: [preferences objectForKey:@"player5" ] forKey:@"player6"];
        
        [preferences setObject: _yourName.text forKey:@"player1"];
        [preferences setObject:[NSNumber numberWithInt:_score] forKey:@"score1"];
    }else if ([preferences objectForKey:@"score2"]< [NSNumber numberWithInt:_score]){
        [preferences setObject: [preferences objectForKey:@"score2" ] forKey:@"score3"];
        [preferences setObject: [preferences objectForKey:@"score3" ] forKey:@"score4"];
        [preferences setObject: [preferences objectForKey:@"score4" ] forKey:@"score5"];
        [preferences setObject: [preferences objectForKey:@"score5" ] forKey:@"score6"];
        
        [preferences setObject: [preferences objectForKey:@"player2" ] forKey:@"player3"];
        [preferences setObject: [preferences objectForKey:@"player3" ] forKey:@"player4"];
        [preferences setObject: [preferences objectForKey:@"player4" ] forKey:@"player5"];
        [preferences setObject: [preferences objectForKey:@"player5" ] forKey:@"player6"];
        
        [preferences setObject: _yourName.text forKey:@"player2"];
        
        [preferences setObject:[NSNumber numberWithInt:_score] forKey:@"score2"];
    }else if ([preferences objectForKey:@"score3"]< [NSNumber numberWithInt:_score]){
        [preferences setObject: [preferences objectForKey:@"score3" ] forKey:@"score4"];
        [preferences setObject: [preferences objectForKey:@"score4" ] forKey:@"score5"];
        [preferences setObject: [preferences objectForKey:@"score5" ] forKey:@"score6"];
        
        [preferences setObject: [preferences objectForKey:@"player3" ] forKey:@"player4"];
        [preferences setObject: [preferences objectForKey:@"player4" ] forKey:@"player5"];
        [preferences setObject: [preferences objectForKey:@"player5" ] forKey:@"player6"];
        
        [preferences setObject: _yourName.text forKey:@"player3"];
        
        [preferences setObject:[NSNumber numberWithInt:_score] forKey:@"score3"];
    }else if ([preferences objectForKey:@"score4"]< [NSNumber numberWithInt:_score]){
        [preferences setObject: [preferences objectForKey:@"score4" ] forKey:@"score5"];
        [preferences setObject: [preferences objectForKey:@"score5" ] forKey:@"score6"];
        
        [preferences setObject: [preferences objectForKey:@"player4" ] forKey:@"player5"];
        [preferences setObject: [preferences objectForKey:@"player5" ] forKey:@"player6"];
        
        [preferences setObject: _yourName.text forKey:@"player4"];
        
        [preferences setObject:[NSNumber numberWithInt:_score] forKey:@"score4"];
    }else if ([preferences objectForKey:@"score5"]< [NSNumber numberWithInt:_score]){
        
        [preferences setObject: [preferences objectForKey:@"score5" ] forKey:@"score6"];
        
        [preferences setObject: [preferences objectForKey:@"player5" ] forKey:@"player6"];
        
        [preferences setObject: _yourName.text forKey:@"player5"];
        
        [preferences setObject:[NSNumber numberWithInt:_score] forKey:@"score5"];
    }else if ([preferences objectForKey:@"score6"]< [NSNumber numberWithInt:_score]){
        [preferences setObject: _yourName.text forKey:@"player6"];
        [preferences setObject:[NSNumber numberWithInt:_score] forKey:@"score6"];
    }else{
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@ %d",_playerName,_score);
    
    _yourScore.text = [NSString stringWithFormat:@"%d",_score ];
    
    // Construct URL to sound file
    NSString *path = [NSString stringWithFormat:@"%@/smb_gameover.wav", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundUrl = [NSURL fileURLWithPath:path];
    
    // Create audio player object and initialize with URL to sound
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    [_audioPlayer play];
    // Do any additional setup after loading the view.
    NSUserDefaults* preferences = [NSUserDefaults standardUserDefaults];
    _player1Score.text = [NSString stringWithFormat:@"1. %@:%@",[preferences objectForKey:@"player1"], [[preferences objectForKey:@"score1"] stringValue]];
    _player2Score.text = [NSString stringWithFormat:@"2. %@:%@",[preferences objectForKey:@"player2"], [[preferences objectForKey:@"score2"] stringValue]];
    _player3Score.text = [NSString stringWithFormat:@"3. %@:%@",[preferences objectForKey:@"player3"], [[preferences objectForKey:@"score3"] stringValue]];
    _player4Score.text = [NSString stringWithFormat:@"4. %@:%@",[preferences objectForKey:@"player4"], [[preferences objectForKey:@"score4"] stringValue]];
    _player5Score.text = [NSString stringWithFormat:@"5. %@:%@",[preferences objectForKey:@"player5"], [[preferences objectForKey:@"score5"] stringValue]];
    _player6Score.text = [NSString stringWithFormat:@"6. %@:%@",[preferences objectForKey:@"player6"], [[preferences objectForKey:@"score6"] stringValue]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
