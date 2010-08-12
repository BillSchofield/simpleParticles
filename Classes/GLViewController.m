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
	glLoadIdentity();
	
	// set up camera
	gluLookAt(0, 3, 0, /* look from camera XYZ */
			  0, 0, -1, /* look at the origin */
			  0, 0, 1); /* positive Y up vector */	

	[particleEmitter draw ];
	
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
