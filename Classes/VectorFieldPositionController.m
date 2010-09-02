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
  Vector3fSet(
					&positions[i], 
					[RandomFloat randomFrom: -.1 to: .1],
					[RandomFloat randomFrom: -.1 to: .1],
					[RandomFloat randomFrom: -.1 to: .1]
					);

}
-(id) initWithVertices: (VertexArray*) sourceVertices{
	vertices = sourceVertices;
	int numberOfVertices = [vertices getNumberOfVertices];
	Vector3f* positions = [vertices getVertices];
	for (int i=0; i<numberOfVertices; ++i) {
		[self spawnParticle: i positions: positions];
	}

	
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
		if (Vector3fMagnitude(*currentPosition) > 10.) {
			[self spawnParticle: i positions: positions];
		}
	}
}

@end
