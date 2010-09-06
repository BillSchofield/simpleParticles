#import "AccelerationController.h"

@implementation AccelerationController

-(id) initWithVertices: (VertexArray*) vertices withVelocities: (Vector3f*) sourceVelocities withAcceleration: (Vector3f*) sourceAcceleration andWithTimer: (Timer*) sourceTimer {
	particles = [vertices getVertices];
	numberOfParticles = [vertices getNumberOfVertices];
	acceleration = sourceAcceleration;
	velocities = sourceVelocities;
	timer = sourceTimer;	
	return self;
}

-(void) update {
	double timeScale = [timer lastUpdateTimeInSeconds];
	for (int i=0; i<numberOfParticles; ++i) {
		Vector3fScaleAndAccumulate(&velocities[i], timeScale, acceleration);
		Vector3fScaleAndAccumulate(&particles[i], timeScale, &velocities[i]);
	}
}
@end