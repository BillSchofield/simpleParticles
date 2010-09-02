//
//  Spawner.h
//  Particles
//
//  Created by bschofil on 8/14/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VertexArray.h"
#import "OpenGLCommon.h"

@interface Spawner : NSObject {
	VertexArray* verticies;
	Vector3f* velocities;
	int indexOfUnusedList;
	
}
- (id) initWithVertices: (VertexArray*) sourceVertices withVelocities: (Vector3f*) sourceVelocities;
- (void) spawn;
- (int) claimUnusedVertex;
- (void) despawn: (int) i;

@end
