//
//  BounceWithPlaneAndDespawnController.m
//  Particles
//
//  Created by bschofil on 8/16/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "BounceWithPlaneAndDespawnController.h"


@implementation BounceWithPlaneAndDespawnController
Vertex3D* vertices;
Vertex3D* velocities;
Spawner* spawner;
-(id) initWithVertices: (VertexArray*) sourceVertices withVelocities:(Vertex3D*) sourceVelocities withSpawner:(Spawner*) sourceSpawner
{
	vertices = sourceVertices;
	velocities = sourceVelocities;
	spawner = sourceSpawner;
	[spawner retain];
	return self;
}

-(void) update
{
	Vertex3D perpendicularVector = Vertex3DMake(0,0,1);
	float planeOffset = -2;
	const int numberOfVertices = [vertices getNumberOfVertices];
	for (int i=0; i<numberOfVertices; ++i) 
	{
		Vertex3D* vertex = &([vertices getVertices][i]);
		float dotProduct = Vector3DDotProduct(*vertex, perpendicularVector);
		if (dotProduct < planeOffset)
		{
			velocities[i].z *= -0.5;
			if (fabs(velocities[i].z) < 0.05)
			{
				[spawner despawn: i];
			}
		}
	}
}

-(void) dealloc
{
	[spawner release];
	[super dealloc];
}
@end
