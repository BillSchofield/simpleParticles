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

-(id) initWithVelocities: (Vertex3D*) sourceVelocities andNumberOfVelocities: (int) sourceNumberOfVelocities
{
	velocities = sourceVelocities;
	numberOfVelocities = sourceNumberOfVelocities;
	frictionCoefficients = malloc(sizeof(float) * numberOfVelocities);
	for (int i=0; i<numberOfVelocities; ++i) 
	{
		frictionCoefficients[i] = [self randomFrom: 0.985 toMaximum: 0.99];
	}
	
	return self;
}

-(void) update
{
	for (int i=0; i<numberOfVelocities; ++i) 
	{
		velocities[i] = Vector3DMake(
									 velocities[i].x,// * frictionCoefficients[i],
									 velocities[i].y,// * frictionCoefficients[i],
									 velocities[i].z * frictionCoefficients[i]
									 );
	}
}

-(void) dealloc
{
	free(frictionCoefficients);
	[super dealloc];
}
@end
