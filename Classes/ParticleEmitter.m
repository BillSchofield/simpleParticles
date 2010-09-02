#import "ParticleEmitter.h"

@implementation ParticleEmitter

- (id) init: (VertexArray *) particlesIn withColors: (Color*) colorsIn withControllers: (NSMutableArray *) controllersIn  
{
	particles = particlesIn;
	colors = colorsIn;
	controllers = controllersIn;
	return self;
}

-(void)draw: (VertexDrawer*) vertexDrawer;
{
	[self update];
	[vertexDrawer Draw: particles colorArray: colors];
}

- (void) update
{
	for (id controller in controllers) 
	{
		[controller update];
	}	
}

- (void)dealloc 
{
	for (id controller in [controllers reverseObjectEnumerator])
	{
		free(controller);
	}
	free(controllers);
	free(colors);
	free(particles);

    [super dealloc];
}

@end
