//
//  RadiusParticleColorController.h
//  Particles
//
//  Created by bschofil on 8/8/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//
#import "OpenGLCommon.h"
#import "Controller.h"
#import "VertexArray.h"

@interface PositionColorController : Controller 
{
@private	
	Vector3f* particles;
	size_t numberOfParticles;
	Color3D* colors;
	float scale;
}
-(id) init: (VertexArray*) positions withColors:(Color3D*) colorsToUpdate andScale: (float) sourceScale;
-(void) update;
@end
