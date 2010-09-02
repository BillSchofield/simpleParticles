#import "Spawner.h"

@implementation Spawner


- (id) initWithVertices: (VertexArray*) sourceVertices withVelocities: (Vector3f*) sourceVelocities
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
		Vector3f particleEmitterPosition = Vector3fMake(0, 0, -1);
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
		Vector3f* firstUnusedVertex = &([verticies getVertices][indexOfNewVertex]);
		indexOfUnusedList = firstUnusedVertex->x;
	}
	return indexOfNewVertex;
}

- (void) despawn: (int) i  
{
	Vector3f* vertexToDespawn = &([verticies getVertices][i]);
	//Track index in x component
	vertexToDespawn->x = indexOfUnusedList;
	// Move vertex far from the origin
	vertexToDespawn->y = 999999;
	vertexToDespawn->z = 999999;
	
	indexOfUnusedList = i;
}

@end
