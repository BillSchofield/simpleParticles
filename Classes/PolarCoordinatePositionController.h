#import "Controller.h"
#import "VertexArray.h"
#import "Vector3f.h"

@interface PolarCoordinatePositionController : Controller 
{
@private
	float* radii;
	float* deltaRadii;
	Vector3f* particles;
	size_t numberOfParticles;
}
-(id) initWithVertices: (VertexArray*) vertices;
-(void) update;
@end
