//
//  PolarCoordinatePositionController.h
//  Particles
//
//  Created by bschofil on 8/8/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "OpenGLCommon.h"
#import "Controller.h"

@interface PolarCoordinatePositionController : Controller 
{
@private

	float* radii;
	float* deltaRadii;
	Vertex3D* particles;
	size_t numberOfParticles;
}
-(id) init: (Vertex3D*) theParticles: (size_t) theNumberOfParticles;
-(void) update;
-(void) free;
@end
