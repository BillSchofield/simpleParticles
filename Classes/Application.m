#import "Application.h"
#import "ParticleTrailEmitter.h"
#import "GravityParticleEmitterFactory.h"
#import "PolarCoordinateEmitterFactory.h"
#import "VectorFieldEmitterFactory.h"
#import "NSDateTimer.h"

@implementation Application
-(id) init{
	updateTimer = [[NSDateTimer alloc] init];
	emitterFactories = [[NSMutableArray alloc] init];
	[emitterFactories addObject: [[ParticleTrailEmitter alloc] initWithGravity: &currentAcceleration andWithTimer: updateTimer]];
//	[emitterFactories addObject: [[GravityParticleEmitterFactory alloc] initWithGravity: &currentAcceleration andWithTimer: updateTimer]];
//	[emitterFactories addObject: [VectorFieldEmitterFactory alloc]];
//	[emitterFactories addObject: [PolarCoordinateEmitterFactory alloc]];
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
