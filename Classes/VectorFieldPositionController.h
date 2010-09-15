//
//  VectorFieldPositionController.h
//  Particles
//
//  Created by bschofil on 8/19/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "Controller.h"

@class VertexArray;

@interface VectorFieldPositionController : Controller 
{
	VertexArray* vertices;
	int indexOfParticleToRespawn;
}
-(id) initWithVertices: (VertexArray*) sourceVertices;
-(void) update;

@end
