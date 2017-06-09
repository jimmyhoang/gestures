//
//  TapViewController.m
//  Gestures
//
//  Created by Jimmy Hoang on 2017-06-08.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

#import "TapViewController.h"

@interface TapViewController ()

@property (nonatomic) UIView* squareView;

@end

@implementation TapViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = 100;
    CGFloat height = 100;
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) - width/2, CGRectGetMidY(self.view.bounds) - height/2, width, height);
    
    self.squareView = [[UIView alloc] initWithFrame:frame];
    self.squareView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.squareView];
    
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(squareTapped:)];
    [self.squareView addGestureRecognizer:tapGesture];
}

-(void)squareTapped:(UITapGestureRecognizer*)sender {
    self.squareView.backgroundColor = [self.squareView.backgroundColor isEqual: [UIColor purpleColor]] ? [UIColor orangeColor] : [UIColor purpleColor];
}

@end
