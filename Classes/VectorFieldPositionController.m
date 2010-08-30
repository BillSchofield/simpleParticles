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

- (void) spawnParticle: (int) i positions: (Vector3D *) positions  {
  Vector3DSet(
					&positions[i], 
					[RandomFloat randomFrom: -.1 to: .1],
					[RandomFloat randomFrom: -.1 to: .1],
					[RandomFloat randomFrom: -.1 to: .1]
					);

}
-(id) initWithVertices: (VertexArray*) sourceVertices{
	vertices = sourceVertices;
	int numberOfVertices = [vertices getNumberOfVertices];
	Vector3D* positions = [vertices getVertices];
	for (int i=0; i<numberOfVertices; ++i) {
		[self spawnParticle: i positions: positions];
	}

	
	return self;
}

-(void) update{
	int numberOfVertices = [vertices getNumberOfVertices];
	Vector3D* positions = [vertices getVertices];
	float scale = 1.0/10;
	for (int i=0; i<numberOfVertices; ++i) {
		Vector3D* currentPosition = &positions[i];
//		Vector3D velocity = Vector3DMake(tan(currentPosition->x*scale), sin(currentPosition->y*scale), tan (currentPosition->z*scale));
		Vector3D velocity = Vector3DMake(fastSinf(currentPosition->y), fastSinf(currentPosition->z), fastSinf (currentPosition->x));
//		Vector3D velocity = Vector3DMake(fastSinf(currentPosition->y + currentPosition->z), fastSinf(currentPosition->x + currentPosition->z), fastSinf (currentPosition->x + currentPosition->y));
		Vector3DScaleAndAccumulate(currentPosition, scale, &velocity);
		if (Vector3DMagnitude(*currentPosition) > 10.) {
			[self spawnParticle: i positions: positions];
		}
	}
}

@end
