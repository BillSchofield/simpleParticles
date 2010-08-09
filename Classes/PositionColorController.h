//
//  RadiusParticleColorController.h
//  Particles
//
//  Created by bschofil on 8/8/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "OpenGLCommon.h"

@interface PositionColorController : NSObject 
{
@private	
	Vertex3D* particles;
	size_t numberOfParticles;
	Color3D* colors;
}
-(id) init: (Color3D*) theColors:(Vertex3D*) theParticles: (size_t) theNumberOfParticles;
-(void) update;
-(void) free;
@end
