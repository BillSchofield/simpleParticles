//
//  ParticleEmitter.m
//  Particles
//
//  Created by bschofil on 8/11/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "ParticleEmitter.h"

@implementation ParticleEmitter

- (id) init: (VertexArray *) particlesIn withColors: (Color3D *) colorsIn withControllers: (NSMutableArray *) controllersIn  
{
	particles = particlesIn;
	colors = colorsIn;
	controllers = controllersIn;
	return self;
}

-(void)draw: (VertexDrawer*) vertexDrawer;
{
	[self update];
	[vertexDrawer Draw: particles colorArray: colors];
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
