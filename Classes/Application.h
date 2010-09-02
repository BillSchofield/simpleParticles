#import "ParticleEmitter.h"
#import "Timer.h"
#import "Vector3f.h"

@interface Application : NSObject {
	ParticleEmitter* particleEmitter;
	NSMutableArray* emitterFactories;
	int currentEmitterFactoryIndex;
	Vector3f currentAcceleration;
	Timer* updateTimer;
}
- (id) init;
- (void) update;
- (void) next;

@end
