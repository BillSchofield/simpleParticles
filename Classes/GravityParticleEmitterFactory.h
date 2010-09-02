#import "Timer.h"
#import "Vector3f.h"

@interface GravityParticleEmitterFactory : NSObject {
	Vector3f* acceleration;
	Timer* timer;
}
- (id) initWithGravity: (Vector3f*) sourceAcceleration andWithTimer: (Timer*) sourceTimer;
- (id) create;
@end
