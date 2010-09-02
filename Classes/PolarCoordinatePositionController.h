//
//  PolarCoordinatePositionController.h
//  Particles
//
//  Created by bschofil on 8/8/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "OpenGLCommon.h"
#import "Controller.h"
#import "VertexArray.h"

@interface PolarCoordinatePositionController : Controller 
{
@private
	float* radii;
	float* deltaRadii;
	Vector3f* particles;
	size_t numberOfParticles;
}
-(id) initWithVertices: (VertexArray*) vertices;
-(void) update;
@end
