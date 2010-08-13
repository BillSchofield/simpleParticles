//
//  RadiusParticleColorController.m
//  Particles
//
//  Created by bschofil on 8/8/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "PositionColorController.h"


@interface PositionColorController ()
@property Vertex3D* particles;
@property size_t numberOfParticles;
@property Color3D* colors;
@end


@implementation PositionColorController
@synthesize particles;
@synthesize numberOfParticles;
@synthesize colors;

-(id) init: (VertexArray*) positions withColors:(Color3D*) colorsToUpdate;
{
	particles = [positions getVertices];
	colors = colorsToUpdate;
	numberOfParticles = [positions getNumberOfVertices];
	for (int i=0; i<numberOfParticles; ++i) 
	{		
		colors[i].red = random()%1000/1000.0;
		colors[i].green	= random()%1000/1000.0;
		colors[i].blue = random()%1000/1000.0;
		colors[i].alpha = 1.0;
	}
	
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

-(void) free
{
}
@end

