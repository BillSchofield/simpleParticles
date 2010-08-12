//
//  ParticleEmitter.m
//  Particles
//
//  Created by bschofil on 8/11/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "ParticleEmitter.h"
const int numberOfParticles = 1024;

@implementation ParticleEmitter

- (id) init
{
	particles = malloc(sizeof(Vertex3D) * numberOfParticles);
	colors = malloc(sizeof(Color3D) * numberOfParticles);
	controllers = [[NSMutableArray alloc] init];
	[controllers addObject: [[GravityPositionController alloc] init:particles :numberOfParticles]];
	[controllers addObject: [[PolarCoordinatePositionController alloc] init:particles :numberOfParticles]];
	[controllers addObject: [[PositionColorController alloc] init:colors :particles :numberOfParticles]];
	return self;
}

- (void) update
{
	for (id controller in controllers) 
	{
		[controller update];
	}	
}

- (void)dealloc 
{
	for (id controller in [controllers reverseObjectEnumerator])
	{
		free(controller);
	}
	free(controllers);
	free(colors);
	free(particles);

    [super dealloc];
}

@end
