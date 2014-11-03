//
//  Wario.h
//  MERogers_Game
//
//  Created by Max Rogers on 10/30/14.
//  Copyright (c) 2014 maxrogers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Wario : NSObject
@property UIImageView *avatar;
@property int x;
@property int y;
@property int width;
@property int height;
@property NSArray *run_animation;
@property NSString *animation_name;
@property int animate_cursor;
@property BOOL animating;
-(id) init;
-(void) animate;
@end
