//
//  Application.m
//  Particles
//
//  Created by bschofil on 8/25/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "Application.h"
#import "GravityParticleEmitterFactory.h"
#import "PolarCoordinateEmitterFactory.h"
#import "VectorFieldEmitterFactory.h"

@implementation Application
-(id) init{
	emitterFactories = [[NSMutableArray alloc] init];
	[emitterFactories addObject: [[GravityParticleEmitterFactory alloc] initWithGravity: &currentAcceleration]];
	[emitterFactories addObject: [VectorFieldEmitterFactory alloc]];
	[emitterFactories addObject: [PolarCoordinateEmitterFactory alloc]];
	timeUntilNextEmitter = -1;
	[self next];
	return self;
}

-(void) update{
	VertexDrawer* vertexDrawer = [VertexDrawer alloc];
	[particleEmitter draw: vertexDrawer ];
	free(vertexDrawer);
}

-(void) next {
	[particleEmitter release];
	particleEmitter = [[emitterFactories objectAtIndex:currentEmitterFactoryIndex] create];
	currentEmitterFactoryIndex++;
	if (currentEmitterFactoryIndex >= [emitterFactories count]){
		currentEmitterFactoryIndex = 0;
	}
}
	
- (void)dealloc {
	free(particleEmitter);
	
	for (id emitterFactory in [emitterFactories reverseObjectEnumerator])
	{
		free(emitterFactory);
	}
	[super dealloc];
}


@end
