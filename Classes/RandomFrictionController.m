#import "RandomFrictionController.h"
#import "RandomFloat.h"

@implementation RandomFrictionController

-(id) initWithVelocities: (Vector3f*) sourceVelocities andNumberOfVelocities: (int) sourceNumberOfVelocities andWithTimer: (Timer*) sourceTimer
{
	velocities = sourceVelocities;
	numberOfVelocities = sourceNumberOfVelocities;
	timer = sourceTimer;
	frictionCoefficients = malloc(sizeof(float) * numberOfVelocities);
	for (int i=0; i<numberOfVelocities; ++i) 
	{
		frictionCoefficients[i] = [RandomFloat randomFrom: 0.5 to: 0.7];
	}
	
	return self;
}

-(void) update
{
	for (int i=0; i<numberOfVelocities; ++i) 
	{
		float dragCoefficient = 1 - ((1 - frictionCoefficients[i]) * [timer timeSinceLastUpdateInSeconds]);
		Vector3fScale(&velocities[i], dragCoefficient);
	}
}

-(void) dealloc
{
	free(frictionCoefficients);
	[super dealloc];
}
@end
