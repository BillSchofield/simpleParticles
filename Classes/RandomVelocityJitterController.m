#import "RandomVelocityJitterController.h"
#import "RandomFloat.h"

@implementation RandomVelocityJitterController
-(id) initWithVelocities: (Vector3f*) sourceVelocities andNumberOfVelocities: (int) sourceNumberOfVelocities andWithTimer:(Timer*) sourceTimer
{
	velocities = sourceVelocities;
	numberOfVelocities = sourceNumberOfVelocities;
	timer = sourceTimer;
	return self;
}

-(void) update
{
	for (int i=0; i<numberOfVelocities; ++i) 
	{
		if ([RandomFloat randomFrom: 0.0 to: 1000.0] > 990.0) {
			float theta = [RandomFloat randomFrom: 0.0 to: PI2];
			Vector3f jitterDirection = Vector3fMake(cos(theta), sin(theta), [RandomFloat randomFrom: -.5 to: .5]);
			Vector3fScaleAndAccumulate(&velocities[i], 0.2, &jitterDirection);
		}
	}
}

@end
