//
//  SpawnController.m
//  Particles
//
//  Created by bschofil on 8/13/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "SpawnController.h"


@implementation SpawnController

-(id) initWithSpawner: (Spawner*) controlledSpawner withSpawnRate: (float) particlesPerSecond
{
	spawner = controlledSpawner;
	[spawner retain];
	spawnRate = particlesPerSecond;
	timeUntilNextSpawn = 1/spawnRate;
	return self;
}

-(void) update
{
	float deltaTime = 1.0/30.0;
	timeUntilNextSpawn -= deltaTime;
	while (timeUntilNextSpawn < 0.0) 
	{
		[spawner spawn];
		timeUntilNextSpawn += 1/spawnRate;
	}
}

-(void) dealloc
{
	[spawner release];
	[super dealloc];
}
@end
