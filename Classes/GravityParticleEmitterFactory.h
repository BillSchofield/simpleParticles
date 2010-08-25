#import "OpenGLCommon.h"

@interface GravityParticleEmitterFactory : NSObject {
	Vector3D* acceleration;
}
- (id) initWithGravity: (Vector3D*) sourceAcceleration;
- (id) create;
@end
