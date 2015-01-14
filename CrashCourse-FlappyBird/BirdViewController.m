//
//  BirdViewController.m
//  CrashCourse-FlappyBird
//
//  Created by HackReactor on 1/13/15.
//  Copyright (c) 2015 HackReactor. All rights reserved.
//

#import "BirdViewController.h"

@interface BirdViewController ()

@end

@implementation BirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)drawBirdOfWidth:(int)width andHeight:(int)height onView:(UIView*)view{
    float birdX = view.frame.size.width/width*4;
    float birdY = (view.frame.size.height - height)/2 - 20;
    [self.view setFrame:CGRectMake(birdX, birdY, width, height)];
    [self.view setBackgroundColor:[UIColor redColor]];
    [view addSubview:self.view];
}

@end
