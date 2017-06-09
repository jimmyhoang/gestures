//
//  RotationViewController.m
//  Gestures
//
//  Created by Jimmy Hoang on 2017-06-08.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

#import "RotationViewController.h"

@interface RotationViewController ()

@property (nonatomic, strong) UIView* redBoxView;
@property (nonatomic, strong) UIRotationGestureRecognizer* rotationGesture;
@end

@implementation RotationViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = 100;
    CGFloat height = 100;
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) - width/2, CGRectGetMidY(self.view.bounds) - height/2, width, height);
    
    self.redBoxView = [[UIView alloc] initWithFrame:frame];
    self.redBoxView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.redBoxView];
    
    self.rotationGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotate:)];
    [self.redBoxView addGestureRecognizer:self.rotationGesture];
}

-(void)rotate:(UIRotationGestureRecognizer*)sender {
    
    CGFloat angle = self.rotationGesture.rotation;
    self.redBoxView.transform = CGAffineTransformRotate(self.redBoxView.transform, angle);
    self.rotationGesture.rotation = 0.0;
}
@end
