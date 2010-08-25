//
//  GravityControllerFactory.m
//  Particles
//
//  Created by bschofil on 8/12/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "GravityParticleEmitterFactory.h"
#import "AccelerationController.h"
#import "ConstantColorController.h"
#import "ParticleEmitter.h"
#import "CollideWithBoxAndStopController.h"
#import "RandomFrictionController.h"
#import "RandomVelocityJitterController.h"
#import "AccelerationFromAccelerometerController.h"

@implementation GravityParticleEmitterFactory


- (id) initWithGravity: (Vector3D*) sourceAcceleration{
	acceleration = sourceAcceleration;
	return self;
}
- (id) create{
	glLoadIdentity(); 
	gluLookAt(0, 2, 0, /* look from camera XYZ */
			  0, 0, 0, /* look at the origin */
			  0, 0, 1); /* positive Y up vector */
	
	const int numberOfParticles = 8192;
	VertexArray* particles = [[VertexArray alloc] init: numberOfParticles];
	Color3D* colors = malloc(sizeof(Color3D) * numberOfParticles);
	Vertex3D* velocities = malloc(sizeof(Vertex3D) * numberOfParticles);
	NSMutableArray *controllers = [[NSMutableArray alloc] init];

	[controllers addObject: [[CollideWithBoxAndStopController alloc] initWithVertices: particles withVelocities:velocities]];
	[controllers addObject: [[RandomVelocityJitterController alloc] initWithVelocities:velocities andNumberOfVelocities:numberOfParticles]];	
	[controllers addObject: [[AccelerationController alloc] initWithVertices:particles withVelocities: velocities withAcceleration: acceleration]];
	[controllers addObject: [[RandomFrictionController alloc] initWithVelocities:velocities andNumberOfVelocities:numberOfParticles]];	
	[controllers addObject: [[ConstantColorController alloc] initWithColors:colors withNumberOfColors:numberOfParticles]];
	[controllers addObject: [[AccelerationFromAccelerometerController alloc] initWithAcceleration:acceleration]];
	
	return [[ParticleEmitter alloc] init: particles withColors:colors withControllers:controllers];
}

@end
