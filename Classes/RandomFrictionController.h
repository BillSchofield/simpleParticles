#import "Timer.h"
#import "Vector3f.h"

@interface RandomFrictionController : NSObject {
	Vector3f* velocities;
	float* frictionCoefficients;
	int numberOfVelocities;
	Timer* timer;
}
-(id) initWithVelocities: (Vector3f*) sourceVelocities andNumberOfVelocities: (int) sourceNumberOfVelocities andWithTimer: (Timer*) sourceTimer;
-(void) update;
@end
