#import "Application.h"
#import "GravityParticleEmitterFactory.h"
#import "PolarCoordinateEmitterFactory.h"
#import "VectorFieldEmitterFactory.h"

@implementation Application
-(id) init{
	updateTimer = [[Timer alloc] init];
	emitterFactories = [[NSMutableArray alloc] init];
	[emitterFactories addObject: [[GravityParticleEmitterFactory alloc] initWithGravity: &currentAcceleration andWithTimer: updateTimer]];
	[emitterFactories addObject: [VectorFieldEmitterFactory alloc]];
	[emitterFactories addObject: [PolarCoordinateEmitterFactory alloc]];
	[self next];
	return self;
}

-(void) update{
	[updateTimer update];
	VertexDrawer* vertexDrawer = [VertexDrawer alloc];
	[particleEmitter draw: vertexDrawer ];
	free(vertexDrawer);
}

-(void) next {
	[particleEmitter release];
	particleEmitter = [[emitterFactories objectAtIndex:currentEmitterFactoryIndex] create];
	++currentEmitterFactoryIndex;
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
	[updateTimer release];
	[super dealloc];
}


@end
