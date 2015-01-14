//
//  ViewController.m
//  CrashCourse-FlappyBird
//
//  Created by HackReactor on 1/12/15.
//  Copyright (c) 2015 HackReactor. All rights reserved.
//

#import "ViewController.h"
#import "PipeViewController.h"

@interface ViewController (){
//    NSMutableArray *pipes;
    NSTimer *createPipeInterval;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    pipes = [[NSMutableArray alloc] init];
    // Do any additional setup after loading the view, typically from a nib.
    
    createPipeInterval = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(createNewPipe) userInfo:nil repeats:YES];
}

-(void)createNewPipe{
    PipeViewController *pipe = [[PipeViewController alloc] init];
    double index = arc4random()%4;
    NSLog(@"%f", index);
    [pipe drawPipeWithHeight:self.view.frame.size.height width:self.view.frame.size.width/5 openingAt:index onView:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
