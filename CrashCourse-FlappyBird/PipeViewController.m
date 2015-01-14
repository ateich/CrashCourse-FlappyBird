//
//  PipeViewController.m
//  CrashCourse-FlappyBird
//
//  Created by HackReactor on 1/12/15.
//  Copyright (c) 2015 HackReactor. All rights reserved.
//

#import "PipeViewController.h"
#import "BirdViewController.h"

@interface PipeViewController (){
    UIImageView *pipe;
    NSTimer *movePipeInterval;
    UIImageView *pipeTop;
    UIImageView *pipeBottom;
    UIView *opening;
    
    int numberOfSections;
    UIView *obstacle;
}

@end

@implementation PipeViewController

-(PipeViewController*)init{
    self = [super init];
    numberOfSections = 4;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)setObstacleForCollision:(UIView*)theObstacle{
    obstacle = theObstacle;
}

-(void)drawPipeWithHeight:(int)height width:(int)width openingAt:(int)openingPosition onView:(UIViewController*)vc{
//    openingPosition = 1;
    
    pipe = [[UIImageView alloc] init];
    [pipe setFrame:CGRectMake(vc.view.frame.size.width, 0, width, height)];
    [vc.view addSubview:pipe];
    [vc.view sendSubviewToBack:pipe];
    
    pipeTop = [[UIImageView alloc] init];
    pipeBottom = [[UIImageView alloc] init];
    
    [pipe addSubview:pipeTop];
    [pipe addSubview:pipeBottom];
    
    [pipeTop setBackgroundColor:[UIColor greenColor]];
    [pipeBottom setBackgroundColor:[UIColor greenColor]];
    
    float pipeSectionHeight = vc.view.frame.size.height/numberOfSections;
    
    [pipeTop setFrame:CGRectMake(0, 0, width, pipeSectionHeight*(openingPosition))];
    
    float pipeBottomHeight = pipeSectionHeight*(numberOfSections-1-openingPosition);
    [pipeBottom setFrame:CGRectMake(0, vc.view.frame.size.height - pipeBottomHeight, width, pipeBottomHeight)];
    
    opening = [[UIView alloc] init];
    [opening setFrame:CGRectMake(0, pipeTop.frame.size.height, width, height)];
    
    if(movePipeInterval){
        [movePipeInterval invalidate];
    }
    movePipeInterval = [NSTimer scheduledTimerWithTimeInterval:.005 target:self selector:@selector(movePipe) userInfo:nil repeats:YES];
}

-(void)movePipe{
    [pipe setFrame:CGRectMake(pipe.frame.origin.x - 1, pipe.frame.origin.y, pipe.frame.size.width, pipe.frame.size.height)];
    
    //check if we hit the bird
    
    //if inside the pipe (horizontally)
    //if pipe.x is less than bird.x + bird.width
    //and pipe.x + pipe.width > bird.x
    
    //if not (within the opening vertically)
    //obstacle.y > opening.y
    //and obstacle.y+obstacle.height < opening.y+opening.height
    
    //collision detected, kill obstacle
    if(pipe.frame.origin.x <= obstacle.frame.origin.x + obstacle.frame.size.width){
        if(!(obstacle.frame.origin.y > opening.frame.origin.y &&
             obstacle.frame.origin.y + obstacle.frame.size.height < opening.frame.origin.y + opening.frame.size.height)){
            NSLog(@"COLLISION");
            [movePipeInterval invalidate];
        }
    }
    
    
    //check if the pipe is off screen
    if(pipe.frame.origin.x + pipe.frame.size.width < 0){
        [movePipeInterval invalidate];
        [pipe removeFromSuperview];
    }
}

-(int)getNumberOfSections{
    return numberOfSections;
}

@end
