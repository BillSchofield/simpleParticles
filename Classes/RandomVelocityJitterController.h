#import "Controller.h"
#import "Timer.h"
#import "Vector3f.h"

@interface RandomVelocityJitterController : Controller {
	Vector3f* velocities;
	int numberOfVelocities;
	Timer* timer;
}
-(id) initWithVelocities: (Vector3f*) sourceVelocities andNumberOfVelocities: (int) sourceNumberOfVelocities andWithTimer:(Timer*) sourceTimer;
-(void) update;

@end
