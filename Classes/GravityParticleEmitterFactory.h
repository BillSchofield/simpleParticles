#import "OpenGLCommon.h"
#import "Timer.h"

@interface GravityParticleEmitterFactory : NSObject {
	Vector3D* acceleration;
	Timer* timer;
}
- (id) initWithGravity: (Vector3D*) sourceAcceleration andWithTimer: (Timer*) sourceTimer;
- (id) create;
@end
