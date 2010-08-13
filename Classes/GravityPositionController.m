//
//  GravityPositionController.m
//  Particles
//
//  Created by bschofil on 8/8/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "GravityPositionController.h"

@interface GravityPositionController ()
@property Vertex3D* particles;
@property size_t numberOfParticles;
@end


@implementation GravityPositionController
@synthesize particles;
@synthesize numberOfParticles;

static const float acceleration = -1;
static float angle = 0;

- (void) rotateAndScaleVertex: (GLfloat) radius theta: (GLfloat) theta vertex_p: (Vertex3D *) vertex_p  
{
	vertex_p->x = cos(theta) * radius;
	vertex_p->y = sin(theta) * radius;
	vertex_p->z = -3.0;
	
}

- (void) spawnParticle: (int) i  
{
	Vertex3D particleEmitterPosition = Vertex3DMake(0, 0, 0);
	particles[i] = particleEmitterPosition;
	velocities[i].x = cos(angle)/6;
	velocities[i].y = sin(angle)/6;
	velocities[i].z = (random()%1000)/1000.0;
	angle = (random()%6283)/1000.0; // Random[0,Pi*2] Make a real random number generator
	
}

-(id) initWithVertices: (VertexArray*) vertices
{
	particles = [vertices getVertices];
	numberOfParticles = [vertices getNumberOfVertices];
	velocities = malloc(sizeof(Vertex3D) * numberOfParticles);
	for (int i=0; i<numberOfParticles; ++i) 
	{
		[self spawnParticle: i];
	}
	
	return self;
}

-(void) update
{
	float timeScale = 0.01;
	for (int i=0; i<numberOfParticles; ++i) 
	{
		velocities[i].z += acceleration * timeScale;
		particles[i].x += velocities[i].x * timeScale;
		particles[i].y += velocities[i].y * timeScale;
		particles[i].z += velocities[i].z * timeScale;
		
		if (particles[i].z < -2)
		{
			velocities[i].z *= -0.5;
			if (fabs(velocities[i].z) < 0.05)
			{
				[self spawnParticle: i];
			}
		}
	}
}

-(void) free
{
	free(velocities);
}
@end