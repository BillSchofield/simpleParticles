#import "SinPositionColorController.h"


@implementation SinPositionColorController
-(id) init: (VertexArray*) positions withColors:(Color*) colorsToUpdate
{
	particles = [positions getVertices];
	colors = colorsToUpdate;
	numberOfParticles = [positions getNumberOfVertices];
	return self;
}

-(void) update
{
	for (int i=0; i<numberOfParticles; ++i) 
	{		
		colors[i].red = (127 * sin(particles[i].x)) + 127;
		colors[i].green = (127 * sin(particles[i].y)) + 127;
		colors[i].blue = (127 * sin(particles[i].z)) + 127;
		colors[i].alpha = 255;
	}
}

@end
