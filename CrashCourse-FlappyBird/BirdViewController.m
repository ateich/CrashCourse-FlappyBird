//
//  BirdViewController.m
//  CrashCourse-FlappyBird
//
//  Created by HackReactor on 1/13/15.
//  Copyright (c) 2015 HackReactor. All rights reserved.
//

#import "BirdViewController.h"

@interface BirdViewController (){
    NSTimer *fall;
    double acceleration;
}

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
    
    fall = [NSTimer scheduledTimerWithTimeInterval:.01 target:self selector:@selector(fallDown) userInfo:nil repeats:YES];
}

-(void)fallDown{
    if(!acceleration){
        acceleration = 0;
    }
    
    acceleration += 1;
    int reduceGravityBy = 10;
    
    [self.view setFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y + acceleration/reduceGravityBy, self.view.frame.size.width, self.view.frame.size.height)];
}

@end
