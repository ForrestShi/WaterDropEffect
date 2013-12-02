//
//  ViewController.m
//  WaterDrop
//
//  Created by Shi Lin on 12/2/13.
//  Copyright (c) 2013 Forrest Shi. All rights reserved.
//

#import "ViewController.h"
@import CoreGraphics;
#import <QuartzCore/QuartzCore.h>

@interface ViewController (){
    UILabel *circle;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    circle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    circle.layer.cornerRadius = circle.bounds.size.width/2.;
    circle.center = self.view.center;
    circle.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:circle];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap:)];
    [self.view addGestureRecognizer:tap];
    
}

- (void)onTap:(UITapGestureRecognizer*)gesture{
    
    //UIView *tapedView = [gesture.view copy];
    UILabel *tapedView = [[UILabel alloc] initWithFrame:circle.frame];
    tapedView.backgroundColor = [UIColor blueColor];
    tapedView.layer.cornerRadius = tapedView.bounds.size.width/2.;
    tapedView.center = circle.center;

    [self.view insertSubview:tapedView belowSubview:circle];
    
    [UIView animateKeyframesWithDuration:.5 delay:0. options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{
        //
        tapedView.transform = CGAffineTransformScale(tapedView.transform, 10., 10.);
        tapedView.alpha = 0.;
        
        circle.transform = CGAffineTransformScale(circle.transform, 1.5, 1.5);
    } completion:^(BOOL finished) {
        //
        [UIView animateKeyframesWithDuration:.5 delay:0. options:UIViewKeyframeAnimationOptionCalculationModeCubicPaced animations:^{
            circle.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            
        }];
    }];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
