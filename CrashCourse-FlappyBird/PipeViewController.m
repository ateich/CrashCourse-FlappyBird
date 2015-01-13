//
//  PipeViewController.m
//  CrashCourse-FlappyBird
//
//  Created by HackReactor on 1/12/15.
//  Copyright (c) 2015 HackReactor. All rights reserved.
//

#import "PipeViewController.h"

@interface PipeViewController ()

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

-(void)drawPipe{
    UIImageView *pipe = [[UIImageView alloc] init];
    [pipe setBackgroundColor:[UIColor greenColor]];
    
    //Draw top of pipe
    //Leave space for bird
    //Draw bottom of pipe
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
