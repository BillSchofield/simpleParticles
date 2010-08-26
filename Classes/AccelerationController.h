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

@interface AccelerationController : Controller 
{
	Vertex3D* particles;
	size_t numberOfParticles;
	Vertex3D* velocities;
	Vertex3D* acceleration;
	Timer* timer;
}
-(id) initWithVertices: (VertexArray*) vertices withVelocities: (Vertex3D*) sourceVelocities withAcceleration: (Vertex3D*) sourceAcceleration andWithTimer: (Timer*) sourceTimer;
-(void) update;
@end