//
//  PipeViewController.h
//  CrashCourse-FlappyBird
//
//  Created by HackReactor on 1/12/15.
//  Copyright (c) 2015 HackReactor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PipeViewController : UIViewController
-(void)drawPipeWithHeight:(int)height width:(int)width openingAt:(int)openingPosition onView:(UIViewController*)vc;
@end
