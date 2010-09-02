#import "PositionColorController.h"

@implementation PositionColorController

-(id) init: (VertexArray*) positions withColors:(Color*) colorsToUpdate andScale: (float) sourceScale
{
	particles = [positions getVertices];
	colors = colorsToUpdate;
	numberOfParticles = [positions getNumberOfVertices];
	scale = sourceScale;
	return self;
}

-(void) update
{
	float inverseScale = 1.0/scale;
	for (int i=0; i<numberOfParticles; ++i) 
	{		
		colors[i].red = fabs(particles[i].x * inverseScale);
		colors[i].green = fabs(particles[i].y * inverseScale);
		colors[i].blue = fabs(particles[i].z * inverseScale);
		colors[i].alpha = 1.0;
	}
}
@end

