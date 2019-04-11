//
//  FakeTouchView.m
//  FakeTouchApp
//
//  Created by RayMi on 2019/4/10.
//  Copyright © 2019 WG. All rights reserved.
//

#import "FakeTouchView.h"

@implementation FakeTouchView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%@",touches);
}

@end
