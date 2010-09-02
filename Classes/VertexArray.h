#import "Vector3f.h"

@interface VertexArray : NSObject {
	Vector3f* vertices;
	int numberOfVertices;
}
- (id) init: (int) size;
- (Vector3f*) getVertices;
- (int) getNumberOfVertices;

@end
