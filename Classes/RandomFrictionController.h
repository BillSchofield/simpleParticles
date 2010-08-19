//
//  RandomFrictionController.h
//  Particles
//
//  Created by bschofil on 8/19/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "OpenGLCommon.h"

@interface RandomFrictionController : NSObject {
	Vertex3D* velocities;
	float* frictionCoefficients;
	int numberOfVelocities;
}
-(id) initWithVelocities: (Vertex3D*) sourceVelocities andNumberOfVelocities: (int) sourceNumberOfVelocities;
-(void) update;
-(float) randomFrom: (float) lowerBound toMaximum: (float) upperBound;

@end
