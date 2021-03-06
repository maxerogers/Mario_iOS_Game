//
//  ShyGuy.h
//  MERogers_Game2
//
//  Created by Max Rogers on 11/2/14.
//  Copyright (c) 2014 maxrogers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ShyGuy : NSObject
@property int x;
@property int y;
@property int width;
@property int height;
@property int animation_cursor;
@property UIImageView *avatar;
-(id) init;
-(void) animate;
@end
