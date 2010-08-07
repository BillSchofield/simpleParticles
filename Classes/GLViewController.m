//
//  GLViewController.m
//  Particles
//
//  Created by bschofil on 8/6/10.
//  Copyright ThoughtWorks 2010. All rights reserved.
//

#import "GLViewController.h"
#import "ConstantsAndMacros.h"
#import "OpenGLCommon.h"


@implementation GLViewController

const int numberOfParticles = 1024;
Vertex3D* particles;
float* radii;
float* deltaRadii;
Color3D* colors;


static const GLfloat pi = 3.1415926;

- (void) rotateAndScaleVertex: (GLfloat) radius theta: (GLfloat) theta vertex_p: (Vertex3D *) vertex_p  {
	vertex_p->x = cos(theta) * radius;
	vertex_p->y = sin(theta) * radius;
	vertex_p->z = -3.0;

}

- (void)drawView:(UIView *)theView
{
	//move to constructor
	if (particles == 0){
		particles = malloc(sizeof(Vertex3D) * numberOfParticles);
		radii = malloc(sizeof(float) * numberOfParticles);
		deltaRadii = malloc(sizeof(float) * numberOfParticles);
		colors = malloc(sizeof(Color3D) * numberOfParticles);

		for (int i=0; i<numberOfParticles; ++i) {
			radii[i] = cos(2 * 6 * pi * (i%numberOfParticles)/(numberOfParticles));
			deltaRadii[i] = -0.01;
			Color3DSet(&colors[i], 
					   cos(2 * pi * (i%numberOfParticles/1.0)/numberOfParticles/1), 
					   sin(2 * pi * (i%numberOfParticles/1.0)/numberOfParticles/1), 
					   tanf(2 * pi * (i%numberOfParticles/1.0)/numberOfParticles/1), 
					   1.0);
		}
	}
    
	static GLfloat theta = 0;
	GLfloat deltaTheta = pi/128;
	GLfloat thetaIncrement = 2 * pi / numberOfParticles;
	
	glLoadIdentity();

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
		Vertex3D* currentVertex = &particles[i];
		[self rotateAndScaleVertex: radii[i] theta: theta + thetaIncrement * i vertex_p: currentVertex];
	}
	glVertexPointer(3, GL_FLOAT, 0, particles);
	glColorPointer(4, GL_FLOAT, 0, colors);
	glClearColor(0.7, 0.7, 0.7, 1.0);
	glColor4f(1.0, 0.0, 0.0, 1.0);
	glPointSize(2.0);
	glEnable(GL_BLEND);
	glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
	
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	glEnableClientState(GL_VERTEX_ARRAY);
	glEnableClientState(GL_COLOR_ARRAY);
	glDrawArrays(GL_POINTS, 0, numberOfParticles);
	glDisableClientState(GL_COLOR_ARRAY);
	glDisableClientState(GL_VERTEX_ARRAY);
	
}

-(void)setupView:(GLView*)view
{
	const GLfloat zNear = 0.01, zFar = 1000.0, fieldOfView = 45.0; 
	GLfloat size; 
	glEnable(GL_DEPTH_TEST);
	glMatrixMode(GL_PROJECTION); 
	size = zNear * tanf(DEGREES_TO_RADIANS(fieldOfView) / 2.0); 
	CGRect rect = view.bounds; 
	glFrustumf(-size, size, -size / (rect.size.width / rect.size.height), size / 
			   (rect.size.width / rect.size.height), zNear, zFar); 
	glViewport(0, 0, rect.size.width, rect.size.height);  
	glMatrixMode(GL_MODELVIEW);
	
	glLoadIdentity(); 
}
- (void)dealloc 
{
    [super dealloc];
	free(colors);
	free(deltaRadii);
	free(radii);
	free(particles);
}
@end
