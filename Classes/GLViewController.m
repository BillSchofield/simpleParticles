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
#import "VectorFieldEmitterFactory.h"

@implementation GLViewController

- (void)drawView:(UIView *)theView
{	
	glClearColor(0.3, 0.3, 0.3, 1.0);
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	
	static float timeUntilNextEmitter = -1;	
	timeUntilNextEmitter -= 1.0/50;
	if (timeUntilNextEmitter < 0){
		timeUntilNextEmitter = 15;
		[particleEmitter release];
		particleEmitter = [[emitterFactories objectAtIndex:currentEmitterFactoryIndex] create];
		currentEmitterFactoryIndex++;
		if (currentEmitterFactoryIndex >= [emitterFactories count]){
			currentEmitterFactoryIndex = 0;
		}
	}
	
	VertexDrawer* vertexDrawer = [VertexDrawer alloc];
	[particleEmitter draw: vertexDrawer ];
	free(vertexDrawer);
	
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
	
	emitterFactories = [[NSMutableArray alloc] init];
	[emitterFactories addObject: [[GravityParticleEmitterFactory alloc] initWithGravity: &currentAcceleration]];
	[emitterFactories addObject: [VectorFieldEmitterFactory alloc]];
	[emitterFactories addObject: [PolarCoordinateEmitterFactory alloc]];
}
- (void)dealloc 
{
	free(particleEmitter);
	
	for (id emitterFactory in [emitterFactories reverseObjectEnumerator])
	{
		free(emitterFactory);
	}
	[super dealloc];
}

@end
