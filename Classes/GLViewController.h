//
//  GLViewController.h
//  Particles
//
//  Created by bschofil on 8/6/10.
//  Copyright ThoughtWorks 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GLView.h"
#import "OpenGLCommon.h"
#import "ParticleEmitter.h"

@interface GLViewController : UIViewController < UIAccelerometerDelegate, GLViewDelegate >
{
	@private
	NSMutableArray *particleEmitters;
	
	UIAccelerometer *accelerometer;
	Vector3D currentAcceleration;
}

@property (nonatomic, retain) UIAccelerometer *accelerometer;

@end
