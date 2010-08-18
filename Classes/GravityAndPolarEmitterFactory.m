//
//  GravityAndPolarEmitterFactory.m
//  Particles
//
//  Created by bschofil on 8/12/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "GravityAndPolarEmitterFactory.h"
#import "PolarCoordinatePositionController.h"
#import "AccelerationController.h"
#import "PositionColorController.h"
#import "ParticleEmitter.h"
#import "Spawner.h"
#import "SpawnController.h"
#import "BounceWithPlaneAndDespawnController.h"
#import "ConstantColorController.h"



// This needs some love. Spawner and PolarCoordinatePositionController are fighting over the original position of particles.

@implementation GravityAndPolarEmitterFactory
- (id) create
{
	const int numberOfParticles = 1024;
	VertexArray* particles = [[VertexArray alloc] init: numberOfParticles];
	Color3D* colors = malloc(sizeof(Color3D) * numberOfParticles);
	Vertex3D* velocities = malloc(sizeof(Vertex3D) * numberOfParticles);
	NSMutableArray *controllers = [[NSMutableArray alloc] init];
	
	[controllers addObject: [[PolarCoordinatePositionController alloc] initWithVertices:particles]];
	Spawner* spawner = [[Spawner alloc] initWithVertices:particles withVelocities:velocities];
	[controllers addObject: [[SpawnController alloc] initWithSpawner: spawner withSpawnRate: 10.0]];
	[controllers addObject: [[BounceWithPlaneAndDespawnController alloc] initWithVertices: particles withVelocities:velocities withSpawner:spawner]];
	
//	[controllers addObject: [[AccelerationController alloc] initWithVertices:particles withVelocities: velocities withAcceleration: Vector3DMake(0, 0, -1)]];
	[controllers addObject: [[ConstantColorController alloc] initWithColors:colors withNumberOfColors:numberOfParticles]];
//	[controllers addObject: [[PositionColorController alloc] init:particles withColors:colors]];
	
	[spawner release];
	return [[ParticleEmitter alloc] init: particles withColors:colors withControllers:controllers];
}

@end
