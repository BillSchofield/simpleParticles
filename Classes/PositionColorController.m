//
//  RadiusParticleColorController.m
//  Particles
//
//  Created by bschofil on 8/8/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "PositionColorController.h"

@implementation PositionColorController

-(id) init: (VertexArray*) positions withColors:(Color3D*) colorsToUpdate
{
	particles = [positions getVertices];
	colors = colorsToUpdate;
	numberOfParticles = [positions getNumberOfVertices];	
	return self;
}

-(void) update
{
	for (int i=0; i<numberOfParticles; ++i) 
	{		
		colors[i].red = fabs(particles[i].x);
		colors[i].green	= fabs(particles[i].y);
		colors[i].blue = fabs(particles[i].z);
		colors[i].alpha = 1.0;
	}
}
@end

