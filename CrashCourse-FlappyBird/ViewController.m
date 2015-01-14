//
//  ViewController.m
//  CrashCourse-FlappyBird
//
//  Created by HackReactor on 1/12/15.
//  Copyright (c) 2015 HackReactor. All rights reserved.
//

#import "ViewController.h"
#import "PipeViewController.h"
#import "BirdViewController.h"

@interface ViewController (){
//    NSMutableArray *pipes;
    NSTimer *createPipeInterval;
    BirdViewController *bird;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    pipes = [[NSMutableArray alloc] init];
    // Do any additional setup after loading the view, typically from a nib.
    
    bird = [[BirdViewController alloc] init];
    double birdSize = self.view.frame.size.height/10;
    [bird drawBirdOfWidth:birdSize andHeight:birdSize onView:self.view];
    createPipeInterval = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(createNewPipe) userInfo:nil repeats:YES];
//    [self createNewPipe];
}

-(void)createNewPipe{
    PipeViewController *pipe = [[PipeViewController alloc] init];
    double index = arc4random()%[pipe getNumberOfSections];
    [pipe setObstacleForCollision:bird.view];
    [pipe drawPipeWithHeight:self.view.frame.size.height width:self.view.frame.size.width/7 openingAt:index onView:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
