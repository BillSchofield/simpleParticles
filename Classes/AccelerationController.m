//
//  AccelerationController.m
//  Particles
//
//  Created by bschofil on 8/8/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "AccelerationController.h"

@implementation AccelerationController

-(id) initWithVertices: (VertexArray*) vertices withVelocities: (Vertex3D*) sourceVelocities withAcceleration: (Vertex3D*) sourceAcceleration andWithTimer: (Timer*) sourceTimer {
	particles = [vertices getVertices];
	numberOfParticles = [vertices getNumberOfVertices];
	acceleration = sourceAcceleration;
	velocities = sourceVelocities;
	timer = sourceTimer;	
	return self;
}

-(void) update {
	float timeScale = [timer timeSinceLastUpdateInSeconds];
	for (int i=0; i<numberOfParticles; ++i) {
		Vector3DScaleAndAccumulate(&velocities[i], timeScale, acceleration);
		Vector3DScaleAndAccumulate(&particles[i], timeScale, &velocities[i]);
	}
}
@end