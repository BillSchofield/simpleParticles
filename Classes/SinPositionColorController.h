#import "Controller.h"
#import "VertexArray.h"
#import "Color.h"

@interface SinPositionColorController : Controller 
{
@private	
	Vector3f* particles;
	size_t numberOfParticles;
	Color* colors;
}
-(id) init: (VertexArray*) positions withColors:(Color*) colorsToUpdate;
-(void) update;

@end
