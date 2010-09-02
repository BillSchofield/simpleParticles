//
//  CollideWithBoxAndStopController.h
//  Particles
//
//  Created by bschofil on 8/19/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Controller.h"
#import "VertexArray.h"
#import "Plane.h"


@interface CollideWithBoxAndBounceController : Controller {
	VertexArray* vertices;
	Vector3f* velocities;
	NSMutableArray* collisionPlanes;
}
-(id) initWithVertices: (VertexArray*) sourceVertices withVelocities:(Vector3f*) sourceVelocities;
-(void) update;

@end
