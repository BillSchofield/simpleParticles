#import "VertexArray.h"
#import "Vector3f.h"

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
