//
//  RandomFrictionController.m
//  Particles
//
//  Created by bschofil on 8/19/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "RandomFrictionController.h"


@implementation RandomFrictionController
-(float) randomFrom: (float) lowerBound toMaximum: (float) upperBound
{
	int largeNumber = 65536;
	float difference = upperBound - lowerBound;
	return (random()%largeNumber)*difference/largeNumber + lowerBound;
}

-(id) initWithVelocities: (Vertex3D*) sourceVelocities andNumberOfVelocities: (int) sourceNumberOfVelocities andWithTimer: (Timer*) sourceTimer
{
	velocities = sourceVelocities;
	numberOfVelocities = sourceNumberOfVelocities;
	timer = sourceTimer;
	frictionCoefficients = malloc(sizeof(float) * numberOfVelocities);
	for (int i=0; i<numberOfVelocities; ++i) 
	{
		frictionCoefficients[i] = [self randomFrom: 0.5 toMaximum: 0.7];
	}
	
	return self;
}

-(void) update
{
	for (int i=0; i<numberOfVelocities; ++i) 
	{
		float dragCoefficient = 1 - ((1 - frictionCoefficients[i]) * [timer timeSinceLastUpdateInSeconds]);
		Vector3DScale(&velocities[i], dragCoefficient);
	}
}

-(void) dealloc
{
	free(frictionCoefficients);
	[super dealloc];
}
@end
