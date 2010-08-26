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
-(float) randomFrom: (float) lowerBound toMaximum: (float) upperBound
{
	int largeNumber = 65536;
	float difference = upperBound - lowerBound;
	return (random()%largeNumber)*difference/largeNumber + lowerBound;
}

-(id)initWithAcceleration: (Vector3D*)accelerationToControl{
	acceleration = accelerationToControl;

	self.accelerometer = [UIAccelerometer sharedAccelerometer];
	self.accelerometer.updateInterval = .1;
	self.accelerometer.delegate = self;
	
	Vector3DSet(acceleration, 0, 0, -2);
	return self;
}

-(void) update{
	static float time = 0;
	time += 1.0/100;
	if (time > 5) {
		time = 0;
		float pitch = [self randomFrom: 0.0 toMaximum: 2*3.14159];
		float yaw = [self randomFrom: 0.0 toMaximum: 2*3.14159];
		Vector3DRotateToDirection(pitch, yaw, acceleration);	
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
