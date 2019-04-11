//
//  FirstViewController.m
//  FakeTouchApp
//
//  Created by RayMi on 2019/4/10.
//  Copyright © 2019 WG. All rights reserved.
//

#import "FirstViewController.h"

#import <PTFakeTouch/PTFakeTouch.h>
#import <PTFakeTouch/PTFakeMetaTouch.h>
#import "FakeTouchView.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//
//    FakeTouchView *view = [[FakeTouchView alloc] initWithFrame:self.view.bounds];
//    [self.view addSubview:view];
//    view.backgroundColor= [UIColor yellowColor];
    
    UIControl *ctrl = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    [self.view addSubview:ctrl];
    ctrl.backgroundColor = [UIColor redColor];
    [ctrl addTarget:self action:@selector(onTouched:) forControlEvents:UIControlEventTouchUpInside];
 
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self fakce];
    });

}
- (void)onTouched:(id)sender{
    NSLog(@"11111");
}
- (void)fakce{
    static int p = 100;
    NSInteger pointId = [PTFakeMetaTouch fakeTouchId:[PTFakeMetaTouch getAvailablePointId] AtPoint:CGPointMake(p,p) withTouchPhase:UITouchPhaseBegan];
    [PTFakeMetaTouch fakeTouchId:pointId AtPoint:CGPointMake(p,p) withTouchPhase:UITouchPhaseEnded];
    [self addDotAt:CGPointMake(p,p)];
    
    p++;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self fakce];
    });

}
- (void)addDotAt:(CGPoint )p{
    UIView *dot = [[UIView alloc] initWithFrame:CGRectMake(p.x, p.y, 1, 1)];
    dot.backgroundColor = [UIColor blueColor];
    [self.view addSubview:dot];
}

@end
