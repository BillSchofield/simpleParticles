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
	glClearColor(0.3, 0.3, 0.3, 1.0);
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);	
	[application update];	
}

-(void)setupView:(GLView*)view
{	
	const GLfloat zNear = 0.01, zFar = 1000.0, fieldOfView = 45.0; 
	glEnable(GL_DEPTH_TEST);
	glMatrixMode(GL_PROJECTION); 
	GLfloat size = zNear * tanf(DEGREES_TO_RADIANS(fieldOfView) / 2.0); 
	CGRect rect = view.bounds; 
	glFrustumf(-size, size, -size / (rect.size.width / rect.size.height), size / 
			   (rect.size.width / rect.size.height), zNear, zFar); 
	glViewport(0, 0, rect.size.width, rect.size.height);  
	glMatrixMode(GL_MODELVIEW);
	
	glLoadIdentity(); 

	application = [[Application alloc] init];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	[application next];
}

- (void)dealloc 
{
	[application release];
	[super dealloc];
}

@end
