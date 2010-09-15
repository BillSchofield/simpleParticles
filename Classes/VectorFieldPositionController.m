//
//  VectorFieldPositionController.m
//  Particles
//
//  Created by bschofil on 8/19/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "VectorFieldPositionController.h"
#import "VertexArray.h"
#import "RandomFloat.h"

@implementation VectorFieldPositionController

- (void) spawnParticle: (int) i positions: (Vector3f *) positions  {
	float spawnPoint = 3.0;
	float offset = 0.1;
	Vector3fSet(
					&positions[i], 
					[RandomFloat randomFrom: spawnPoint to: spawnPoint + offset],
					[RandomFloat randomFrom: spawnPoint to: spawnPoint + offset],
					[RandomFloat randomFrom: spawnPoint to: spawnPoint + offset]
					);

}
-(id) initWithVertices: (VertexArray*) sourceVertices{
	vertices = sourceVertices;
	int numberOfVertices = [vertices getNumberOfVertices];
	Vector3f* positions = [vertices getVertices];
	for (int i=0; i<numberOfVertices; ++i) {
		[self spawnParticle: i positions: positions];
	}

	indexOfParticleToRespawn = 0;
	
	return self;
}

-(void) update{
	int numberOfVertices = [vertices getNumberOfVertices];
	Vector3f* positions = [vertices getVertices];
	float scale = 1.0/10;
	for (int i=0; i<numberOfVertices; ++i) {
		Vector3f* currentPosition = &positions[i];
//		Vector3f velocity = Vector3fMake(tan(currentPosition->x*scale), sin(currentPosition->y*scale), tan (currentPosition->z*scale));
		Vector3f velocity = Vector3fMake(sin(currentPosition->y), sin(currentPosition->z), sin(currentPosition->x));
//		Vector3f velocity = Vector3fMake(sin(currentPosition->y + currentPosition->z), sin(currentPosition->x + currentPosition->z), sin(currentPosition->x + currentPosition->y));
		Vector3fScaleAndAccumulate(currentPosition, scale, &velocity);		
	}
	for (int i=0; i<64; ++i) {
		[self spawnParticle: indexOfParticleToRespawn++ positions: positions];
		if (indexOfParticleToRespawn >= numberOfVertices) {
			indexOfParticleToRespawn = 0;
		} 		
	}
}

@end
