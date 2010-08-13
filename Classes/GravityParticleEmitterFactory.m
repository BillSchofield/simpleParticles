//
//  GravityControllerFactory.m
//  Particles
//
//  Created by bschofil on 8/12/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "GravityParticleEmitterFactory.h"
#import "GravityPositionController.h"
#import "ConstantColorController.h"
#import "ParticleEmitter.h"


@implementation GravityParticleEmitterFactory
- (id) create
{
	const int numberOfParticles = 1024;
	VertexArray* particles = [[VertexArray alloc] init: numberOfParticles];
	Color3D* colors = malloc(sizeof(Color3D) * numberOfParticles);
	NSMutableArray *controllers = [[NSMutableArray alloc] init];
	
	[controllers addObject: [[GravityPositionController alloc] initWithVertices:particles]];
	[controllers addObject: [[ConstantColorController alloc] initWithColors:colors withNumberOfColors:numberOfParticles]];
		
	return [[ParticleEmitter alloc] init: particles withColors:colors withControllers:controllers];
}

@end
