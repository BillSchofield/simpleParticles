#import "AccelerationController.h"

@implementation AccelerationController

-(id) initWithVertices: (VertexArray*) vertices withVelocities: (Vector3f*) sourceVelocities withAcceleration: (Vector3f*) sourceAcceleration andWithTimer: (Timer*) sourceTimer {
	particles = vertices;
	acceleration = sourceAcceleration;
	velocities = sourceVelocities;
	timer = sourceTimer;	
	return self;
}

-(void) update {
	double timeScale = [timer lastUpdateTimeInSeconds];
	Vector3f* positions = [particles getVertices];
	int numberOfPositions = [particles getNumberOfVertices];
	for (int i=0; i<numberOfPositions; ++i) {
		Vector3fScaleAndAccumulate(&velocities[i], timeScale, acceleration);
		Vector3fScaleAndAccumulate(&positions[i], timeScale, &velocities[i]);
	}
}
@end