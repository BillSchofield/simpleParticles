#import "PolarCoordinatePositionController.h"

@implementation PolarCoordinatePositionController

- (void) rotateAndScaleVertex: (float) radius theta: (float) theta vertex_p: (Vector3f *) vertex_p  
{
	vertex_p->x = cos(theta) * radius;
	vertex_p->y = sin(theta) * radius;	
}

-(id) initWithVertices: (VertexArray*) vertices;
{
	particles = vertices;
	
	int numberOfPositions = [particles getNumberOfVertices];
	radii = malloc(sizeof(float) * numberOfPositions);
	deltaRadii = malloc(sizeof(float) * numberOfPositions);
	Vector3f* positions = [particles getVertices];
	for (int i=0; i<numberOfPositions; ++i) 
	{
		radii[i] = cos(6 * PI2 * (i%numberOfPositions)/(numberOfPositions));
		deltaRadii[i] = -0.01;
		positions[i].z = 0.0;

	}
	return self;
}

-(void) update
{
	static float theta = 0;
	float deltaTheta = PI/128;
	int numberOfPositions = [particles getNumberOfVertices];
	float thetaIncrement = PI2 / numberOfPositions;
	theta += deltaTheta;
	for (int i=0; i<numberOfPositions; ++i) 
	{
		radii[i] += deltaRadii[i];
		if (radii[i] < 0 || radii[i] > 1) {
			deltaRadii[i] *= -1;
		}
	}
	Vector3f* positions = [particles getVertices];
	for (int i=0; i<numberOfPositions; ++i) 
	{
		Vector3f* currentVertex = &positions[i];
		[self rotateAndScaleVertex: radii[i] theta: theta + thetaIncrement * i vertex_p: currentVertex];
	}
}

-(void) dealloc
{
	free(deltaRadii);
	free(radii);
	[super dealloc];
}
@end
