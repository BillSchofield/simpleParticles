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

@interface AccelerationController : Controller 
{
	Vertex3D* particles;
	size_t numberOfParticles;
	Vertex3D* acceleration;
	Vertex3D* velocities;
}
-(id) initWithVertices: (VertexArray*) vertices withVelocities: (Vertex3D*) sourceVelocities withAcceleration: (Vertex3D*) sourceAcceleration;
-(void) update;
@end