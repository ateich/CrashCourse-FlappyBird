//
//  PipeViewController.m
//  CrashCourse-FlappyBird
//
//  Created by HackReactor on 1/12/15.
//  Copyright (c) 2015 HackReactor. All rights reserved.
//

#import "PipeViewController.h"

@interface PipeViewController (){
    UIImageView *pipe;
    NSTimer *movePipeInterval;
    UIImageView *pipeTop;
    UIImageView *pipeBottom;
}

@end

@implementation PipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// opening position 1 || 2 || 3
-(void)drawPipeWithHeight:(int)height width:(int)width openingAt:(int)openingPosition onView:(UIViewController*)vc{
    pipe = [[UIImageView alloc] init];
//    [pipe setBackgroundColor:[UIColor blueColor]];
    [pipe setFrame:CGRectMake(vc.view.frame.size.width, 0, width, height)];
    [vc.view addSubview:pipe];
    
    pipeTop = [[UIImageView alloc] init];
    pipeBottom = [[UIImageView alloc] init];
    
    [pipe addSubview:pipeTop];
    [pipe addSubview:pipeBottom];
    
    [pipeTop setBackgroundColor:[UIColor greenColor]];
    [pipeBottom setBackgroundColor:[UIColor greenColor]];
    
    int numberOfSections = 4;
    float pipeSectionHeight = vc.view.frame.size.height/numberOfSections;
    
    [pipeTop setFrame:CGRectMake(0, 0, width, pipeSectionHeight*(openingPosition))];
    
    float pipeBottomHeight = pipeSectionHeight*(numberOfSections-1-openingPosition);
    [pipeBottom setFrame:CGRectMake(0, vc.view.frame.size.height - pipeBottomHeight, width, pipeBottomHeight)];
    
    if(movePipeInterval){
        [movePipeInterval invalidate];
    }
    movePipeInterval = [NSTimer scheduledTimerWithTimeInterval:.005 target:self selector:@selector(movePipe) userInfo:nil repeats:YES];
    
    //Draw top of pipe
    //Leave space for bird
    //Draw bottom of pipe
}

-(void)movePipe{
    [pipe setFrame:CGRectMake(pipe.frame.origin.x - 1, pipe.frame.origin.y, pipe.frame.size.width, pipe.frame.size.height)];
    
    //check if we hit the bird
    
    if(pipe.frame.origin.x + pipe.frame.size.width < 0){
        [movePipeInterval invalidate];
        [pipe removeFromSuperview];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
