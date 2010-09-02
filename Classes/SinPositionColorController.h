#import "Controller.h"
#import "VertexArray.h"
#import "Color.h"

@interface SinPositionColorController : Controller 
{
@private	
	Vector3f* particles;
	size_t numberOfParticles;
	Color* colors;
	float scale;
}
-(id) init: (VertexArray*) positions withColors:(Color*) colorsToUpdate andScale: (float) sourceScale;
-(void) update;

@end
