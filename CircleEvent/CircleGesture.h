//
//  CircleGesture.h
//  CircleEvent
//
//  Created by Xizhu on 12-5-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GestureHasCirleedBy  <NSObject>

- (void)GestureHasCircledByAngle:(CGFloat)angle;

@end

@interface CircleGesture : UIGestureRecognizer 

@property (nonatomic, assign) id<GestureHasCirleedBy>  delegate;

@end
