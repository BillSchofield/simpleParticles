//
//  GLViewController.m
//  Particles
//
//  Created by bschofil on 8/6/10.
//  Copyright ThoughtWorks 2010. All rights reserved.
//

#import "GLViewController.h"
#import "ConstantsAndMacros.h"


@implementation GLViewController

- (void)drawView:(UIView *)theView
{
	[particleEmitter update];
	
	glLoadIdentity();
	
	// set up camera
	gluLookAt(0, 3, 0, /* look from camera XYZ */
			  0, 0, -1, /* look at the origin */
			  0, 0, 1); /* positive Y up vector */	
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
	glDrawArrays(GL_POINTS, 0, 1024);// TODO Fix Constant
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

	particleEmitter = [[ParticleEmitter alloc] init];

}
- (void)dealloc 
{
	free(particleEmitter);
    [super dealloc];
}
@end
