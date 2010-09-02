//
//  RandomFrictionController.h
//  Particles
//
//  Created by bschofil on 8/19/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "OpenGLCommon.h"
#import "Timer.h"

@interface RandomFrictionController : NSObject {
	Vector3f* velocities;
	float* frictionCoefficients;
	int numberOfVelocities;
	Timer* timer;
}
-(id) initWithVelocities: (Vector3f*) sourceVelocities andNumberOfVelocities: (int) sourceNumberOfVelocities andWithTimer: (Timer*) sourceTimer;
-(void) update;
@end
