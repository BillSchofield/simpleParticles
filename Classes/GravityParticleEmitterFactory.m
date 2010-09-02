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
#import "CollideWithBoxAndBounceController.h"
#import "RandomFrictionController.h"
#import "RandomVelocityJitterController.h"
#import "AccelerationFromAccelerometerController.h"
#import "FixedCameraController.h"

@implementation GravityParticleEmitterFactory


- (id) initWithGravity: (Vector3D*) sourceAcceleration andWithTimer: (Timer*) sourceTimer {
	acceleration = sourceAcceleration;
	timer = sourceTimer;
	
	return self;
}
- (id) create{
	Vector3D cameraPosition = {0, 4, 0};
	Vector3D cameraTarget = {0, 0, 0};
	Vector3D cameraUp = {0, 0, 1};
	
	const int numberOfParticles = 8192;
	VertexArray* particles = [[VertexArray alloc] init: numberOfParticles];
	Color3D* colors = malloc(sizeof(Color3D) * numberOfParticles);
	Vertex3D* velocities = malloc(sizeof(Vertex3D) * numberOfParticles);
	NSMutableArray *controllers = [[NSMutableArray alloc] init];

	[controllers addObject: [[FixedCameraController alloc] initAtPosition: &cameraPosition withTarget: &cameraTarget andUpDirection: &cameraUp]];
	[controllers addObject: [[CollideWithBoxAndBounceController alloc] initWithVertices: particles withVelocities:velocities]];
	[controllers addObject: [[RandomVelocityJitterController alloc] initWithVelocities:velocities andNumberOfVelocities:numberOfParticles andWithTimer: timer]];	
	[controllers addObject: [[AccelerationController alloc] initWithVertices:particles withVelocities: velocities withAcceleration: acceleration andWithTimer: timer]];
	[controllers addObject: [[RandomFrictionController alloc] initWithVelocities:velocities andNumberOfVelocities:numberOfParticles andWithTimer: timer]];	
	[controllers addObject: [[ConstantColorController alloc] initWithColors:colors withNumberOfColors:numberOfParticles]];
	[controllers addObject: [[AccelerationFromAccelerometerController alloc] initWithAcceleration:acceleration]];
	
	return [[ParticleEmitter alloc] init: particles withColors:colors withControllers:controllers];
}

-(void) dealloc {
	[timer release];
	[super dealloc];
}

@end
