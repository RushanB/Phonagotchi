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
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.petImageView
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    //BUCKET
    self.bucketImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.bucketImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.bucketImageView.image = [UIImage imageNamed:@"bucket"];
    
    [self.view addSubview:self.bucketImageView];
    self.bucketImageView.alpha = 0.8;
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.bucketImageView
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.0
                                                           constant:50.0]];
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:self.bucketImageView
                                                           attribute:NSLayoutAttributeHeight
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:nil
                                                           attribute:NSLayoutAttributeNotAnAttribute
                                                          multiplier:1
                                                            constant:50]];
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:self.bucketImageView
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeTop
                                                          multiplier:1
                                                            constant:500]];
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:self.bucketImageView
                                                           attribute:NSLayoutAttributeLeft
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeLeft
                                                          multiplier:1
                                                            constant:40]];
    
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
                                                            constant:25]];
    
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:self.appleImageView
                                                           attribute:NSLayoutAttributeHeight
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:nil
                                                           attribute:NSLayoutAttributeNotAnAttribute
                                                          multiplier:1
                                                            constant:25]];
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:self.appleImageView
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeTop
                                                          multiplier:1
                                                            constant:510]];
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:self.appleImageView
                                                           attribute:NSLayoutAttributeLeft
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeLeft
                                                          multiplier:1
                                                            constant:50]];
   
    //PETTING
    UIPanGestureRecognizer *petting = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pettingGest:)];
    
    [self.view addGestureRecognizer:petting];
    
    //FEEDING
    UIPinchGestureRecognizer *feeding = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(feedingGest:)];
    
    [self.view addGestureRecognizer:feeding];
    
    //APPLE COPY
    self.appleImageViewCopy = [[UIImageView alloc] initWithImage:self.appleImageView.image];
    self.appleImageViewCopy.translatesAutoresizingMaskIntoConstraints = YES;
    
}

-(void)pettingGest:(UIPanGestureRecognizer *)petting{
    
}

-(void)feedingGest:(UIPinchGestureRecognizer *)feeding{
    
}

@end
