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


- (void) draw
{
	[self update];
	glVertexPointer(3, GL_FLOAT, 0, particles);
	glColorPointer(4, GL_FLOAT, 0, colors);
	glClearColor(0.7, 0.7, 0.7, 1.0);
	glColor4f(1.0, 0.0, 0.0, 1.0);
	glPointSize(2.0);
	glEnable(GL_BLEND);
	glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
	
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	glEnableClientState(GL_VERTEX_ARRAY);
	glEnableClientState(GL_COLOR_ARRAY);
	glDrawArrays(GL_POINTS, 0, 1024);// TODO Fix Constant
	glDisableClientState(GL_COLOR_ARRAY);
	glDisableClientState(GL_VERTEX_ARRAY);
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
