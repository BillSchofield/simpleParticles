//
//  BounceWithPlaneAndDespawnController.h
//  Particles
//
//  Created by bschofil on 8/16/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Controller.h"
#import "VertexArray.h"
#import "Spawner.h"
#import "Plane.h"

@interface BounceInsideBoxController : Controller {
	VertexArray* vertices;
	Vector3f* velocities;
	Spawner* spawner;
	NSMutableArray* collisionPlanes;
	Plane* collisionPlane;
}
-(id) initWithVertices: (VertexArray*) sourceVertices withVelocities:(Vector3f*) sourceVelocities withSpawner:(Spawner*) sourceSpawner;
-(void) update;

@end
