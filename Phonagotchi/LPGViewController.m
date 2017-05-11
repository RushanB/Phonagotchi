//
//  LPGViewController.m
//  Phonagotchi
//
//  Created by Steven Masuch on 2014-07-26.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPGViewController.h"
#import "Pet.h"

@interface LPGViewController ()

@property(nonatomic, strong) Pet *myPet;

@property (nonatomic) UIImageView *petImageView;
@property (nonatomic) UIImageView *bucketImageView;
@property (nonatomic) UIImageView *appleImageView;
@property (nonatomic) UIImageView *appleImageViewCopy;


@end

@implementation LPGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.myPet = [[Pet alloc]init];
    
    self.view.backgroundColor = [UIColor colorWithRed:(252.0/255.0) green:(240.0/255.0) blue:(228.0/255.0) alpha:1.0];
    
    
    //PET
    self.petImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.petImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.petImageView.image = [UIImage imageNamed:@"default"];
    
    [self.view addSubview:self.petImageView];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.petImageView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    //center x
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.petImageView
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0
                                                           constant:0.0]];
    //center y
    
    //BUCKET
    self.bucketImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.bucketImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.bucketImageView.image = [UIImage imageNamed:@"bucket"];
    
    [self.view addSubview:self.bucketImageView];
    self.bucketImageView.alpha = 0.8;
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.bucketImageView
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1                                                           constant:100]];
    //width
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:self.bucketImageView
                                                           attribute:NSLayoutAttributeHeight
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:nil
                                                           attribute:NSLayoutAttributeNotAnAttribute
                                                          multiplier:1
                                                            constant:100]];
    //height
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:self.bucketImageView
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeTop
                                                          multiplier:1
                                                            constant:450]];
    
    //top

    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:self.bucketImageView
                                                           attribute:NSLayoutAttributeLeft
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeLeft
                                                          multiplier:1
                                                            constant:40]];
    //left
    
    //APPLE
    self.appleImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.appleImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.appleImageView.image = [UIImage imageNamed:@"apple"];
    
    [self.view addSubview:self.appleImageView];
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:self.appleImageView
                                                           attribute:NSLayoutAttributeWidth
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:nil
                                                           attribute:NSLayoutAttributeNotAnAttribute
                                                          multiplier:1
                                                            constant:50]];
    //width
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:self.appleImageView
                                                           attribute:NSLayoutAttributeHeight
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:nil
                                                           attribute:NSLayoutAttributeNotAnAttribute
                                                          multiplier:1
                                                            constant:50]];
    //height
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:self.appleImageView
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeTop
                                                          multiplier:1
                                                            constant:465]];
    //top
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:self.appleImageView
                                                           attribute:NSLayoutAttributeLeft
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeLeft
                                                          multiplier:1
                                                            constant:47]];
   //left
    
    //PETTING
    UIPanGestureRecognizer *petting = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pettingGest:)];
    
    [self.view addGestureRecognizer:petting];
    
    //FEEDING
    UILongPressGestureRecognizer *feeding = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(feedingGest:)];
    
    [self.view addGestureRecognizer:feeding];
    
    //APPLE COPY
    self.appleImageViewCopy = [[UIImageView alloc] initWithImage:self.appleImageView.image];
    self.appleImageViewCopy.translatesAutoresizingMaskIntoConstraints = YES;
    
}

-(void)pettingGest:(UIPanGestureRecognizer *)petting{
    CGPoint petVelocity = [petting velocityInView:self.view]; //velocity of a pan gesture in view
    [self.myPet petRate:petVelocity]; //panning rate
    if(self.myPet.isGrumpy == YES){
        self.petImageView.image = [UIImage imageNamed:@"grumpy"];
    }
}

-(void)feedingGest:(UILongPressGestureRecognizer *)feeding{
    CGPoint location = [feeding locationInView:self.view]; //returns point as location in view
    CGRect newApple; //new rect
    if((feeding.state == UIGestureRecognizerStateBegan || feeding.state == UIGestureRecognizerStateChanged)){
        [self.myPet feedPet:location];
        if(self.myPet.createApple == YES){
            newApple = CGRectMake(50, 510, self.appleImageView.frame.size.width, self.appleImageView.frame.size.height); //create a new apple instance for applecopy
            self.appleImageViewCopy.frame = newApple;
            [self.view addSubview:self.appleImageViewCopy]; //put it in the view
            
            self.appleImageViewCopy.alpha = 1; //set transparency
            
            CGPoint touchLocation = [feeding locationInView:self.view];
            self.appleImageViewCopy.center = touchLocation;
        }
    }
    if(feeding.state == UIGestureRecognizerStateEnded){//when u stop the click
        [self.myPet feedPetLocation:location];
        if(self.myPet.giveApple == YES){  //cat gets apple then if its right location
            [UIImageView animateWithDuration:1.0 delay:1.0 options:0 animations:^{self.appleImageViewCopy.alpha=0.0f;}completion:nil];
        }else{  //drop the apple out of screen view - animation
            [UIImageView animateWithDuration:1.0 delay:0.5 options:UIViewAnimationOptionCurveEaseIn animations:^{self.appleImageViewCopy.frame = CGRectMake((location.x),(location.y+600), self.appleImageViewCopy.frame.size.width, self.appleImageViewCopy.frame.size.height);} completion:nil];
        }
    }
}


@end
