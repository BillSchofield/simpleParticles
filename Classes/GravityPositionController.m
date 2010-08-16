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


-(id) initWithVertices: (VertexArray*) vertices
{
	particles = [vertices getVertices];
	numberOfParticles = [vertices getNumberOfVertices];
	velocities = malloc(sizeof(Vertex3D) * numberOfParticles);
	spawner = [[Spawner alloc] initWithVertices:vertices withVelocities:velocities];
	particleSpawner = [[SpawnController alloc] initWithSpawner: spawner withSpawnRate: 10.0];
	
	return self;
}

-(void) update
{
	[particleSpawner update];
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
				[spawner despawn: i];
				[spawner spawn];
			}
		}
	}
}

-(void) free
{
	free(velocities);
}
@end