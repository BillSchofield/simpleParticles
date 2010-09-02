//
//  AccelerationFromAccelerometerController.m
//  Particles
//
//  Created by bschofil on 8/23/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "AccelerationFromAccelerometerController.h"
#import "RandomFloat.h"

@implementation AccelerationFromAccelerometerController
@synthesize accelerometer;

-(id)initWithAcceleration: (Vector3f*)accelerationToControl {
	acceleration = accelerationToControl;

	self.accelerometer = [UIAccelerometer sharedAccelerometer];
	self.accelerometer.updateInterval = .1;
	self.accelerometer.delegate = self;
	
	Vector3fSet(acceleration, 0, 0, -2);
	return self;
}

-(void) update {
	static float time = 0;
	time += 1.0/100;
	if (time > 5) {
		time = 0;
		float pitch = [RandomFloat randomFrom: 0.0 to: PI2];
		float yaw = [RandomFloat randomFrom: 0.0 to: PI2];
		Vector3fRotateToDirection(pitch, yaw, acceleration);	
	}
}

- (void)dealloc {
	self.accelerometer.updateInterval = 0;
	self.accelerometer.delegate = nil;	
    [super dealloc];
}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)updateAcceleration {
	Vector3fSet(acceleration, -updateAcceleration.x, updateAcceleration.z, updateAcceleration.y);
}

@end
