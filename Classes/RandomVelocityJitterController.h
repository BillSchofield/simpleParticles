//
//  RandomVelocityJitterController.h
//  Particles
//
//  Created by bschofil on 8/19/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "OpenGLCommon.h"
#import "Controller.h"
#import "Timer.h"

@interface RandomVelocityJitterController : Controller {
	Vertex3D* velocities;
	int numberOfVelocities;
	Timer* timer;
}
-(id) initWithVelocities: (Vertex3D*) sourceVelocities andNumberOfVelocities: (int) sourceNumberOfVelocities andWithTimer:(Timer*) sourceTimer;
	-(void) update;
	-(float) randomFrom: (float) lowerBound toMaximum: (float) upperBound;

@end
