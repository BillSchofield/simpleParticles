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
	Vertex3D* particles;
	size_t numberOfParticles;
	Color3D* colors;
}
-(id) init: (VertexArray*) positions withColors:(Color3D*) colorsToUpdate;
-(void) update;
-(void) free;
@end
