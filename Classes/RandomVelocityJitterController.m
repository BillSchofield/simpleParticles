#import "RandomVelocityJitterController.h"
#import "RandomFloat.h"

@implementation RandomVelocityJitterController
-(id) initWithVelocities: (Vertex3D*) sourceVelocities andNumberOfVelocities: (int) sourceNumberOfVelocities andWithTimer:(Timer*) sourceTimer
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
			Vector3D jitterDirection = Vector3DMake(cos(theta), sin(theta), [RandomFloat randomFrom: -.5 to: .5]);
			Vector3DScaleAndAccumulate(&velocities[i], 0.2, &jitterDirection);
		}
	}
}

@end
