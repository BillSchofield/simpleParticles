//
//  SinPositionColorController.m
//  Particles
//
//  Created by bschofil on 8/23/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "SinPositionColorController.h"


@implementation SinPositionColorController
-(id) init: (VertexArray*) positions withColors:(Color*) colorsToUpdate andScale: (float) sourceScale
{
	particles = [positions getVertices];
	colors = colorsToUpdate;
	numberOfParticles = [positions getNumberOfVertices];
	scale = sourceScale;
	return self;
}

-(void) update
{
	float inverseScale = 1.0/scale;
	for (int i=0; i<numberOfParticles; ++i) 
	{		
		colors[i].red = sin(particles[i].x * inverseScale);
		colors[i].green = sin(particles[i].y * inverseScale);
		colors[i].blue = sin(particles[i].z * inverseScale);
		colors[i].alpha = 1.0;
	}
}

@end
