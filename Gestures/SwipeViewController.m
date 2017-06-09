//
//  SwipeViewController.m
//  Gestures
//
//  Created by Jimmy Hoang on 2017-06-08.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

#import "SwipeViewController.h"

@interface SwipeViewController ()
@property (nonatomic, weak) UIView* brownView;
@property (nonatomic, weak) UIView* whiteView;
@property (nonatomic, strong) NSLayoutConstraint* whiteViewRightConstraint;

@end

@implementation SwipeViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    UIView* brownView = [[UIView alloc] initWithFrame:CGRectZero];
    brownView.translatesAutoresizingMaskIntoConstraints = NO;
    brownView.backgroundColor = [UIColor brownColor];
    brownView.clipsToBounds = YES;
    [self.view addSubview:brownView];
    self.brownView = brownView;
    
    NSLayoutConstraint* brownViewYConstraint = [NSLayoutConstraint constraintWithItem:brownView
                                                                            attribute:NSLayoutAttributeCenterY
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:self.view
                                                                            attribute:NSLayoutAttributeCenterY
                                                                           multiplier:1.0
                                                                             constant:0.0];
    brownViewYConstraint.active = YES;
    
    NSLayoutConstraint* brownViewHeightConstraint = [NSLayoutConstraint constraintWithItem:brownView
                                                                                 attribute:NSLayoutAttributeHeight
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:nil
                                                                                 attribute:NSLayoutAttributeNotAnAttribute
                                                                                multiplier:1.0
                                                                                  constant:35];
    brownViewHeightConstraint.active = YES;
    
    NSLayoutConstraint* brownViewLeftConstraint = [NSLayoutConstraint constraintWithItem:brownView
                                                                               attribute:NSLayoutAttributeLeading
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:self.view
                                                                               attribute:NSLayoutAttributeLeading
                                                                              multiplier:1.0
                                                                                constant:10.0];
    brownViewLeftConstraint.active = YES;
    
    NSLayoutConstraint* brownViewRightConstraint = [NSLayoutConstraint constraintWithItem:brownView
                                                                                attribute:NSLayoutAttributeTrailing
                                                                                relatedBy:NSLayoutRelationEqual
                                                                                   toItem:self.view
                                                                                attribute:NSLayoutAttributeTrailing
                                                                               multiplier:1.0
                                                                                 constant:-10.0];
    brownViewRightConstraint.active = YES;
    
    UIView* whiteView = [[UIView alloc] initWithFrame:CGRectZero];
    whiteView.translatesAutoresizingMaskIntoConstraints = NO;
    whiteView.backgroundColor = [UIColor whiteColor];
    [brownView addSubview:whiteView];
    self.whiteView = whiteView;
    
    NSLayoutConstraint* whiteViewHeightConstraint = [NSLayoutConstraint constraintWithItem:whiteView
                                                                                 attribute:NSLayoutAttributeHeight
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:nil
                                                                                 attribute:NSLayoutAttributeNotAnAttribute
                                                                                multiplier:1.0
                                                                                  constant:35];
    whiteViewHeightConstraint.active = YES;
    
    NSLayoutConstraint* whiteViewYConstraint = [NSLayoutConstraint constraintWithItem:whiteView
                                                                            attribute:NSLayoutAttributeCenterY
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:brownView
                                                                            attribute:NSLayoutAttributeCenterY
                                                                           multiplier:1.0
                                                                             constant:0.0];
    whiteViewYConstraint.active = YES;
    
    NSLayoutConstraint* whiteViewLeftConstraint = [NSLayoutConstraint constraintWithItem:whiteView
                                                                               attribute:NSLayoutAttributeLeading
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:brownView
                                                                               attribute:NSLayoutAttributeLeading
                                                                              multiplier:1.0
                                                                                constant:0];
    whiteViewLeftConstraint.active = YES;
    
    self.whiteViewRightConstraint = [NSLayoutConstraint constraintWithItem:whiteView
                                                                 attribute:NSLayoutAttributeTrailing
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:brownView
                                                                 attribute:NSLayoutAttributeTrailing
                                                                multiplier:1.0
                                                                  constant:0];
    self.whiteViewRightConstraint.active = YES;
    
    UISwipeGestureRecognizer* leftSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swiped:)];
    leftSwipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    UISwipeGestureRecognizer* rightSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swiped:)];
    rightSwipeGesture.direction = UISwipeGestureRecognizerDirectionRight;

    [whiteView addGestureRecognizer:leftSwipeGesture];
    [whiteView addGestureRecognizer:rightSwipeGesture];
    
}
                                              
-(void)swiped:(UISwipeGestureRecognizer*)sender {
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
        self.whiteViewRightConstraint.constant = -150;
    } else if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
        self.whiteViewRightConstraint.constant = 0;
    }
}


@end
