//
//  AccelerationController.h
//  Particles
//
//  Created by bschofil on 8/8/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "OpenGLCommon.h"
#import "Controller.h"
#import "VertexArray.h"
#import "Timer.h"

@interface AccelerationController : Controller {
	Vector3f* particles;
	size_t numberOfParticles;
	Vector3f* velocities;
	Vector3f* acceleration;
	Timer* timer;
}
-(id) initWithVertices: (VertexArray*) vertices withVelocities: (Vector3f*) sourceVelocities withAcceleration: (Vector3f*) sourceAcceleration andWithTimer: (Timer*) sourceTimer;
-(void) update;
@end