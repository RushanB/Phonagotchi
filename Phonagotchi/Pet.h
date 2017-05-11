//
//  Pet.h
//  Phonagotchi
//
//  Created by Rushan on 2017-05-11.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Pet : NSObject
//Pan gesture = pet phonagotchi too fast = grumpy
@property (readonly) BOOL isGrumpy;
//long press (over apple) = adds new apple and tracks it
@property (readonly) BOOL createApple;
@property (readonly) BOOL giveApple;
//restfulness level proportional to the amt of time it spent sleeping
@property (nonatomic) int restfulness;

//too fast = grumpy
-(void)petRate:(CGPoint) velocity;
//feeds pet the Apples
-(void)feedPet:(CGPoint) location;
-(void)feedPetLocation:(CGPoint) location;
//if pet doesnt get enough sleep restfulness increases
-(int)petSleep:(int) restfulness;

@end
