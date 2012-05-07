//
//  CircleGesture.m
//  CircleEvent
//
//  Created by Xizhu on 12-5-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CircleGesture.h"

#define PI 3.1415926

@interface  CircleGesture()

@property (nonatomic, assign) CGFloat       angle;

- (CGFloat)angleWithPoint:(CGPoint)start;

@end

@implementation CircleGesture

@synthesize angle, delegate;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    NSLog(@"%s", __FUNCTION__);
    
    UIView *view = [self view];
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:view];
    self.angle = [self angleWithPoint:point];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
//    NSLog(@"%s", __FUNCTION__);
    
    UIView *view = [self view];
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:view];
    CGFloat newAngle = [self angleWithPoint:point];
    
//    NSLog(@"angle changed : %f", newAngle);
    if(delegate && [delegate respondsToSelector:@selector(GestureHasCircledByAngle:)]) {
        [delegate GestureHasCircledByAngle:[self angleBetweenAngle:self.angle endAngle:newAngle]];
    }
    self.angle = newAngle;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
//    NSLog(@"%s", __FUNCTION__);
    
    self.angle = 0.f;
}


- (CGFloat)angleWithPoint:(CGPoint)point; {
    
    CGPoint center = self.view.center;
    CGFloat angleInRadians = atan2f(point.y - center.y, point.x - center.x);
    return 180 * angleInRadians / PI;
}

- (CGFloat)angleBetweenAngle:(CGFloat)beginAngle endAngle:(CGFloat)endAngle {
    if(beginAngle <= 0) {
        return endAngle - beginAngle;
    } else {
        if(endAngle <= 0) {
            return 180 - beginAngle - endAngle;
        } else {
            return endAngle - beginAngle;
        }
    }
}

@end
