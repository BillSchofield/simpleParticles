//
//  GravityPositionController.h
//  Particles
//
//  Created by bschofil on 8/8/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "OpenGLCommon.h"
#import "Controller.h"
#import "VertexArray.h"
#import "Spawner.h"
#import "SpawnController.h"

@interface GravityPositionController : Controller 
{
@private
	Vertex3D* particles;
	size_t numberOfParticles;
	Vertex3D* velocities;
	Spawner* spawner;
	SpawnController* particleSpawner;
}
-(id) initWithVertices: (VertexArray*) vertices;
-(void) update;
-(void) free;
@end