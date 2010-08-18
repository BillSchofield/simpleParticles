//
//  GLViewController.m
//  Particles
//
//  Created by bschofil on 8/6/10.
//  Copyright ThoughtWorks 2010. All rights reserved.
//

#import "GLViewController.h"
#import "ConstantsAndMacros.h"
#import "GravityParticleEmitterFactory.h"
#import "PolarCoordinateEmitterFactory.h"
#import "GravityAndPolarEmitterFactory.h"

@implementation GLViewController

- (void)drawView:(UIView *)theView
{
	glLoadIdentity();
	
	// set up camera
	gluLookAt(0, 3, 0, /* look from camera XYZ */
			  0, 0, -1, /* look at the origin */
			  0, 0, 1); /* positive Y up vector */
	
	glClearColor(0.7, 0.7, 0.7, 1.0);
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

	VertexDrawer* vertexDrawer = [VertexDrawer alloc];
	for (id particleEmitter in particleEmitters) 
	{
		[particleEmitter draw: vertexDrawer ];
	}	
	
	free(vertexDrawer);
	
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
	
	particleEmitters = [[NSMutableArray alloc] init];
	[particleEmitters addObject: [[GravityParticleEmitterFactory alloc] create]];
	[particleEmitters addObject: [[PolarCoordinateEmitterFactory alloc] create]];
//	[particleEmitters addObject: [[GravityAndPolarEmitterFactory alloc] create]];

}
- (void)dealloc 
{
	for (id particleEmitter in [particleEmitters reverseObjectEnumerator])
	{
		free(particleEmitter);
	}
    [super dealloc];
}
@end
