//
//  AccelerationControllerTests.h
//  Particles
//
//  Created by bschofil on 9/4/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "AccelerationController.h"
#import "FakeTimer.h"

@interface AccelerationControllerTests : SenTestCase {
	Vector3f initialPosition;
	Vector3f initialVelocity;
	VertexArray* positions;
	Vector3f* velocities;
	Vector3f acceleration;
	FakeTimer* timer;
	AccelerationController* controller;
}

@end
