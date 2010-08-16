//
//  Spawner.m
//  Particles
//
//  Created by bschofil on 8/14/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "Spawner.h"


//////////////////////////////////////////////////////////////////////
//
// This class manages whether the vertices under its controller exist
// in the view. The current solution to making a vertex 'unspawned'
// is to move it far away from the origin and allow the entire vertex
// array to be drawn. While it is possible that this could be the most
// efficient thing to do, it is not logically correct and I expect there
// is a better way.
//
//////////////////////////////////////////////////////////////////////



@implementation Spawner


- (id) initWithVertices: (VertexArray*) sourceVertices withVelocities: (Vertex3D*) sourceVelocities
{
	verticies = sourceVertices;
	velocities = sourceVelocities;
	indexOfUnusedList = -1;
	for (int i=[sourceVertices getNumberOfVertices]-1; i>=0; --i) 
	{
		[self despawn: i];
	}
	return self;
}

- (void) spawn  
{
	int i = [self claimUnusedVertex];
	if (i >= 0)
	{
		Vertex3D particleEmitterPosition = Vertex3DMake(0, 0, 0);
		[verticies getVertices][i] = particleEmitterPosition;
		float angle = (random()%6283)/1000.0;
		velocities[i].x = cos(angle)/6;
		velocities[i].y = sin(angle)/6;
		velocities[i].z = (random()%1000)/1000.0;
	}
}

- (int) claimUnusedVertex
{
	int indexOfNewVertex = indexOfUnusedList;
	if (indexOfNewVertex >= 0)
	{
		Vertex3D* firstUnusedVertex = &([verticies getVertices][indexOfNewVertex]);
		indexOfUnusedList = firstUnusedVertex->x;
	}
	return indexOfNewVertex;
}

- (void) despawn: (int) i  
{
	Vertex3D* vertexToDespawn = &([verticies getVertices][i]);
	//Track index in x component
	vertexToDespawn->x = indexOfUnusedList;
	// Move vertex far from the origin
	vertexToDespawn->y = 999999;
	vertexToDespawn->z = 999999;
	
	indexOfUnusedList = i;
}

@end
