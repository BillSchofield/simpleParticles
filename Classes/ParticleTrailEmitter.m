//
//  ParticleTrailEmitter.m
//  Particles
//
//  Created by bschofil on 9/12/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "ParticleTrailEmitter.h"
#import "GravityParticleEmitterFactory.h"
#import "AccelerationController.h"
#import "ConstantColorController.h"
#import "ParticleEmitter.h"
#import "CollideWithBoxAndBounceController.h"
#import "RandomFrictionController.h"
#import "RandomVelocityJitterController.h"
#import "AccelerationFromAccelerometerController.h"
#import "FixedCameraController.h"
#import "Color.h"
#import "GLCamera.h"


@implementation ParticleTrailEmitter

- (id) initWithGravity: (Vector3f*) sourceAcceleration andWithTimer: (Timer*) sourceTimer {
	acceleration = sourceAcceleration;
	timer = sourceTimer;
	
	return self;
}
- (id) create{
	Vector3f cameraPosition = {0, 4, 0};
	Vector3f cameraTarget = {0, 0, 0};
	Vector3f cameraUp = {0, 0, 1};
	
	const int numberOfParticles = 8192;
	VertexArray* particles = [[VertexArray alloc] init: numberOfParticles];
	Color* colors = malloc(sizeof(Color) * numberOfParticles);
	Vector3f* velocities = malloc(sizeof(Vector3f) * numberOfParticles);
	NSMutableArray *controllers = [[NSMutableArray alloc] init];
	
	[controllers addObject: [[FixedCameraController alloc] initWithCamera: [GLCamera alloc] atPosition: &cameraPosition withTarget: &cameraTarget andUpDirection: &cameraUp]];
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
