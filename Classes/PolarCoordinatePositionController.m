//
//  PolarCoordinatePositionController.m
//  Particles
//
//  Created by bschofil on 8/8/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "PolarCoordinatePositionController.h"

@interface PolarCoordinatePositionController ()
@property Vertex3D* particles;
@property size_t numberOfParticles;
@end


@implementation PolarCoordinatePositionController
@synthesize particles;
@synthesize numberOfParticles;

static const GLfloat pi = 3.1415926;

- (void) rotateAndScaleVertex: (GLfloat) radius theta: (GLfloat) theta vertex_p: (Vertex3D *) vertex_p  
{
	vertex_p->x = cos(theta) * radius;
	vertex_p->y = sin(theta) * radius;
	vertex_p->z = -3.0;
	
}

-(id) init: (Vertex3D*) theParticles: (size_t) theNumberOfParticles
{
	particles = theParticles;
	numberOfParticles = theNumberOfParticles;
	
	radii = malloc(sizeof(float) * numberOfParticles);
	deltaRadii = malloc(sizeof(float) * numberOfParticles);
	for (int i=0; i<numberOfParticles; ++i) 
	{
		radii[i] = cos(2 * 6 * pi * (i%numberOfParticles)/(numberOfParticles));
		deltaRadii[i] = -0.01;
	}
	return self;
}

-(void) update
{
	static GLfloat theta = 0;
	GLfloat deltaTheta = pi/128;
	GLfloat thetaIncrement = 2 * pi / numberOfParticles;
	theta += deltaTheta;
	for (int i=0; i<numberOfParticles; ++i) 
	{
		radii[i] += deltaRadii[i];
		if (radii[i] < 0 || radii[i] > 1) {
			deltaRadii[i] *= -1;
		}
	}
	for (int i=0; i<numberOfParticles; ++i) 
	{
		Vertex3D* currentVertex = &particles[i];
		[self rotateAndScaleVertex: radii[i] theta: theta + thetaIncrement * i vertex_p: currentVertex];
	}
}

-(void) free
{
	free(deltaRadii);
	free(radii);
}
@end
