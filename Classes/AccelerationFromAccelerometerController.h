//
//  AccelerationFromAccelerometerController.h
//  Particles
//
//  Created by bschofil on 8/23/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "Controller.h"
#import "OpenGLCommon.h"

@interface AccelerationFromAccelerometerController : Controller< UIAccelerometerDelegate > {
	Vector3f* acceleration;
	UIAccelerometer *accelerometer;
}

@property (nonatomic, retain) UIAccelerometer *accelerometer;

-(id)initWithAcceleration: (Vector3f*)accelerationToControl;
-(void) update;
- (void)dealloc;
- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration;
	
@end
