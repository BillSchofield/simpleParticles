//
//  AccelerationFromAccelerometerController.m
//  Particles
//
//  Created by bschofil on 8/23/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "AccelerationFromAccelerometerController.h"


@implementation AccelerationFromAccelerometerController
@synthesize accelerometer;

-(id)initWithAcceleration: (Vector3D*)accelerationToControl{
	acceleration = accelerationToControl;

	self.accelerometer = [UIAccelerometer sharedAccelerometer];
	self.accelerometer.updateInterval = .1;
	self.accelerometer.delegate = self;
	
	Vector3DSet(acceleration, 0, 0, -1);
	return self;
}

-(void) update{
	static float time = 0;
	time += 1.0/100;
	if (time > 6)
	{
		time = 0;
		Vector3DFlip(acceleration);
		
	}
}

- (void)dealloc{
	self.accelerometer.updateInterval = 0;
	self.accelerometer.delegate = nil;	
    [super dealloc];
}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)updateAcceleration {
	Vector3DSet(acceleration, -updateAcceleration.x, updateAcceleration.z, updateAcceleration.y);
}

@end
