#import "OpenGLCommon.h"

@interface GravityParticleEmitterFactory : NSObject {
}
- (id) createWithGravity: (Vector3D*) acceleration;
@end
