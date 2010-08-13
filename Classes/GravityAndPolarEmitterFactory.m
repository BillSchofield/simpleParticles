//
//  GravityAndPolarEmitterFactory.m
//  Particles
//
//  Created by bschofil on 8/12/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "GravityAndPolarEmitterFactory.h"
#import "PolarCoordinatePositionController.h"
#import "GravityPositionController.h"
#import "PositionColorController.h"
#import "ParticleEmitter.h"


@implementation GravityAndPolarEmitterFactory

- (id) create
{
	const int numberOfParticles = 1024;
	VertexArray* particles = [[VertexArray alloc] init: numberOfParticles];
	Color3D* colors = malloc(sizeof(Color3D) * numberOfParticles);
	NSMutableArray *controllers = [[NSMutableArray alloc] init];
	
	[controllers addObject: [[GravityPositionController alloc] initWithVertices:particles]];
	[controllers addObject: [[PolarCoordinatePositionController alloc] initWithVertices:particles]];
	[controllers addObject: [[PositionColorController alloc] init:particles withColors:colors]];
	
	return [[ParticleEmitter alloc] init: particles withColors:colors withControllers:controllers];
}

@end
