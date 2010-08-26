//
//  RandomVelocityJitterController.m
//  Particles
//
//  Created by bschofil on 8/19/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "RandomVelocityJitterController.h"


@implementation RandomVelocityJitterController
-(float) randomFrom: (float) lowerBound toMaximum: (float) upperBound
{
	int largeNumber = 65536;
	float difference = upperBound - lowerBound;
	return (random()%largeNumber)*difference/largeNumber + lowerBound;
}

-(id) initWithVelocities: (Vertex3D*) sourceVelocities andNumberOfVelocities: (int) sourceNumberOfVelocities andWithTimer:(Timer*) sourceTimer
{
	velocities = sourceVelocities;
	numberOfVelocities = sourceNumberOfVelocities;
	timer = sourceTimer;
	return self;
}

-(void) update
{
	for (int i=0; i<numberOfVelocities; ++i) 
	{
		if ([self randomFrom: 0.0 toMaximum: 1000.0] > 990.0) {
			float theta = [self randomFrom: 0.0 toMaximum: 2*3.1415926];
			Vector3D jitterDirection = Vector3DMake(cos(theta), sin(theta), [self randomFrom: -.5 toMaximum: .5]);
			Vector3DScaleAndAccumulate(&velocities[i], 0.2, &jitterDirection);
		}
	}
}

@end
