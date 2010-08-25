//
//  CollideWithBoxAndStopController.m
//  Particles
//
//  Created by bschofil on 8/19/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "CollideWithBoxAndStopController.h"


@implementation CollideWithBoxAndStopController

-(id) initWithVertices: (VertexArray*) sourceVertices withVelocities:(Vertex3D*) sourceVelocities
{
	vertices = sourceVertices;
	velocities = sourceVelocities;

	const int numberOfVertices = [vertices getNumberOfVertices];
	for (int i=0; i<numberOfVertices; ++i) 
	{
		Vertex3D particleEmitterPosition = Vertex3DMake(0, 0, 1);
		[vertices getVertices][i] = particleEmitterPosition;
		float angle = (random()%6283)/1000.0;
		velocities[i].x = cos(angle)/6;
		velocities[i].y = sin(angle)/6;
		velocities[i].z = (random()%1000)/1000.0;
	}	
	
	collisionPlanes = [[NSMutableArray alloc] init];
	[collisionPlanes addObject: [[Plane alloc] initWithNormalVector: Vertex3DMake(1,0,0) andOffset: -1]];
	[collisionPlanes addObject: [[Plane alloc] initWithNormalVector: Vertex3DMake(-1,0,0) andOffset: -1]];
	[collisionPlanes addObject: [[Plane alloc] initWithNormalVector: Vertex3DMake(0,1,0) andOffset: -2]];
	[collisionPlanes addObject: [[Plane alloc] initWithNormalVector: Vertex3DMake(0,-1,0) andOffset: -2]];
	[collisionPlanes addObject: [[Plane alloc] initWithNormalVector: Vertex3DMake(0,0,1) andOffset: -1]];
	[collisionPlanes addObject: [[Plane alloc] initWithNormalVector: Vertex3DMake(0,0,-1) andOffset: -1]];
		
	return self;
}

-(void) update
{
	const int numberOfVertices = [vertices getNumberOfVertices];
	for (int i=0; i<numberOfVertices; ++i) 
	{
		Vertex3D* vertex = &([vertices getVertices][i]);
		for (id plane in collisionPlanes)
		{
			if ( [plane isBelowPlane: vertex] )
			{
//				Vertex3DSet(&velocities[i], 0, 0, 0);
//				[plane movePointToPlane: vertex];
				[plane reflectVector:&velocities[i]];

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
