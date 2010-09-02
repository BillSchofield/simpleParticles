//
//  CollideWithBoxAndStopController.m
//  Particles
//
//  Created by bschofil on 8/19/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "CollideWithBoxAndBounceController.h"
#import "RandomFloat.h"

@implementation CollideWithBoxAndBounceController

-(id) initWithVertices: (VertexArray*) sourceVertices withVelocities:(Vector3f*) sourceVelocities
{
	vertices = sourceVertices;
	velocities = sourceVelocities;

	const int numberOfVertices = [vertices getNumberOfVertices];
	for (int i=0; i<numberOfVertices; ++i) 
	{
		Vector3f particleEmitterPosition = Vector3fMake(0, 0, 1);
		[vertices getVertices][i] = particleEmitterPosition;
		
		float angle = [RandomFloat randomFrom:0 to:2 * 3.145926];
		velocities[i].x = cos(angle)/6;
		velocities[i].y = sin(angle)/6;
		velocities[i].z = [RandomFloat randomFrom: 0.0 to: 1.0];
	}	
	
	collisionPlanes = [[NSMutableArray alloc] init];
	[collisionPlanes addObject: [[Plane alloc] initWithNormalVector: Vector3fMake(1,0,0) andOffset: -1]];
	[collisionPlanes addObject: [[Plane alloc] initWithNormalVector: Vector3fMake(-1,0,0) andOffset: -1]];
	[collisionPlanes addObject: [[Plane alloc] initWithNormalVector: Vector3fMake(0,1,0) andOffset: -1]];
	[collisionPlanes addObject: [[Plane alloc] initWithNormalVector: Vector3fMake(0,-1,0) andOffset: -1]];
	[collisionPlanes addObject: [[Plane alloc] initWithNormalVector: Vector3fMake(0,0,1) andOffset: -1.5]];
	[collisionPlanes addObject: [[Plane alloc] initWithNormalVector: Vector3fMake(0,0,-1) andOffset: -1.5]];
		
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
				[plane reflectVector:&velocities[i]];
				[plane scaleNormalComponentOfVector: &velocities[i] withScale: 0.5];
				[plane movePointToPlane: vertex];


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
	[super dealloc];
}
@end
