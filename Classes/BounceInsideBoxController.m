//
//  BounceWithPlaneAndDespawnController.m
//  Particles
//
//  Created by bschofil on 8/16/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "BounceInsideBoxController.h"


@implementation BounceInsideBoxController
-(id) initWithVertices: (VertexArray*) sourceVertices withVelocities:(Vector3f*) sourceVelocities withSpawner:(Spawner*) sourceSpawner
{
	vertices = sourceVertices;
	velocities = sourceVelocities;
	spawner = sourceSpawner;
	[spawner retain];
	
	collisionPlane = [[Plane alloc] initWithNormalVector: Vector3fMake(0,0,1) andOffset: -2];
	collisionPlanes = [[NSMutableArray alloc] init];
	[collisionPlanes addObject: [[Plane alloc] initWithNormalVector: Vector3fMake(1,0,0) andOffset: -2]];
	[collisionPlanes addObject: [[Plane alloc] initWithNormalVector: Vector3fMake(-1,0,0) andOffset: -2]];
	[collisionPlanes addObject: [[Plane alloc] initWithNormalVector: Vector3fMake(0,1,0) andOffset: -2]];
	[collisionPlanes addObject: [[Plane alloc] initWithNormalVector: Vector3fMake(0,-1,0) andOffset: -2]];
	[collisionPlanes addObject: [[Plane alloc] initWithNormalVector: Vector3fMake(0,0,1) andOffset: -2]];
	[collisionPlanes addObject: [[Plane alloc] initWithNormalVector: Vector3fMake(0,0,-1) andOffset: -2]];
	

	return self;
}

-(void) update
{
	const int numberOfVertices = [vertices getNumberOfVertices];
	for (int i=0; i<numberOfVertices; ++i) 
	{
		Vector3f* vertex = &([vertices getVertices][i]);
		for (id plane in collisionPlanes)
		{
			if ( [plane isBelow: vertex] )
			{
				Vector3fSet(&velocities[i], 0, 0, 0);
				[plane movePointToPlane: vertex];
				
//				if (fabs(velocities[i].z) < 0.05)
//				{
//					[spawner despawn: i];
//				}
			}
		}
	}
}

-(void) dealloc
{
	for (id plane in [collisionPlanes reverseObjectEnumerator])
	{
		free(plane);
	}
	[spawner release];
	[super dealloc];
}
@end
