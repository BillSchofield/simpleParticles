#import "PolarCoordinatePositionController.h"

@implementation PolarCoordinatePositionController

- (void) rotateAndScaleVertex: (float) radius theta: (float) theta vertex_p: (Vector3f *) vertex_p  
{
	vertex_p->x = cos(theta) * radius;
	vertex_p->y = sin(theta) * radius;	
}

-(id) initWithVertices: (VertexArray*) vertices;
{
	particles = [vertices getVertices];
	numberOfParticles = [vertices getNumberOfVertices];
	
	radii = malloc(sizeof(float) * numberOfParticles);
	deltaRadii = malloc(sizeof(float) * numberOfParticles);
	for (int i=0; i<numberOfParticles; ++i) 
	{
		radii[i] = cos(6 * PI2 * (i%numberOfParticles)/(numberOfParticles));
		deltaRadii[i] = -0.01;
		particles[i].z = 0.0;

	}
	return self;
}

-(void) update
{
	static float theta = 0;
	float deltaTheta = PI/128;
	float thetaIncrement = PI2 / numberOfParticles;
	theta += deltaTheta;
	for (int i=0; i<numberOfParticles; ++i) 
	{
		radii[i] += deltaRadii[i];
		if (radii[i] < 0 || radii[i] > 1) {
			deltaRadii[i] *= -1;
		}
	}
	for (int i=0; i<numberOfParticles; ++i) 
	{
		Vector3f* currentVertex = &particles[i];
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
