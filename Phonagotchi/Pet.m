//
//  Pet.m
//  Phonagotchi
//
//  Created by Rushan on 2017-05-11.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import "Pet.h"

@implementation Pet


- (instancetype)init
{
    self = [super init];
    if (self) {
        _isGrumpy = NO;
        //_isHappy = NO;
        //_isSleepy = NO;
        _createApple = NO;
        _giveApple = NO;
        _restfulness = 0;
    }
    return self;
}

- (void)petRate:(CGPoint)velocity{
    if(velocity.x >= 3000 || velocity.x <= -3000){
        NSLog(@"Pet is grumpy!");
        _isGrumpy = YES;
    }else{
        NSLog(@"You firmly pet it.");
        _isGrumpy = NO;
    }
}

-(void)feedPet:(CGPoint)location{
    if((location.x >= 55 && location.y >= 290) || (location.x <= 75 && location.y <= 315)){
        _createApple = YES;
    }else{
        _createApple = NO;
    }
}


-(void)feedPetLocation:(CGPoint)location{
    if((location.x >= 80 && location.y >= 290) || (location.x <= 100 && location.y <= 320)){
        NSLog(@"Pet has the apple!");
        _giveApple = YES;
    }else{
        _giveApple = NO;
    }
}


-(int)petSleep:(int)restfulness{
    float sleep = 0;  //hours
    if(sleep < 0){
        restfulness = 100;
    }else if(sleep <= 5){
        restfulness = 50;
    }else if(sleep >= 10){
        restfulness = 0;
    }
    return sleep;
}



@end
