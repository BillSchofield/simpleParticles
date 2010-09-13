#import "Controller.h"
#import "VertexArray.h"

@interface PolarCoordinatePositionController : Controller 
{
@private
	float* radii;
	float* deltaRadii;
	VertexArray* particles;
	size_t numberOfParticles;
}
-(id) initWithVertices: (VertexArray*) vertices;
-(void) update;
@end
