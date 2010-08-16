//
//  SpawnController.h
//  Particles
//
//  Created by bschofil on 8/13/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Controller.h"
#import "Spawner.h"
#import "VertexArray.h"

@interface SpawnController : Controller {
	float spawnRate;
	float timeUntilNextSpawn;
	Spawner* spawner;
}
-(id) initWithSpawner: (Spawner*) controlledSpawner withSpawnRate: (float) particlesPerSecond;
-(void) update;
@end
