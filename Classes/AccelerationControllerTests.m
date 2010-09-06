//
//  AccelerationControllerTests.m
//  Particles
//
//  Created by bschofil on 9/4/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "AccelerationControllerTests.h"
#import "AccelerationController.h"
#import "FakeTimer.h"

@implementation AccelerationControllerTests
- (void) testGivenSomeVelocityAndNoAccelerationWhenNoTimePassesThenPositionIsUnchanged {
	
	Vector3f initialPosition = Vector3fMake(1, 1, 1);
	Vector3f initialVelocity = Vector3fMake(1, 2, 3);
	
	VertexArray* positions = [[VertexArray alloc] init: 1];
	Vector3fCopy([positions getVertices], &initialPosition);
	Vector3f velocity = initialVelocity;
	Vector3f acceleration = Vector3fOrigin();
	FakeTimer* timer = [[FakeTimer alloc] init];
	
	AccelerationController* controller = [[AccelerationController alloc ] initWithVertices: positions withVelocities: &velocity withAcceleration: &acceleration andWithTimer: timer];
	[controller update];
	
	STAssertEquals(initialPosition, [positions getVertices][0], @"");
}
- (void) testGivenSomeVelocityAndNoAccelerationWhenOneSecondPassesThenPositionIncreasesByOneTimesVelocity {
	
	Vector3f initialPosition = Vector3fMake(1, 1, 1);
	Vector3f initialVelocity = Vector3fMake(1, 2, 3);
	Vector3f expectedResult = Vector3fMake(2, 3, 4);

	
	VertexArray* positions = [[VertexArray alloc] init: 1];
	Vector3fCopy([positions getVertices], &initialPosition);
	Vector3f velocity = initialVelocity;
	Vector3f acceleration = Vector3fOrigin();
	FakeTimer* timer = [[FakeTimer alloc] init];
	[timer timeUpdateInterval: 1.0];
	
	AccelerationController* controller = [[AccelerationController alloc ] initWithVertices: positions withVelocities: &velocity withAcceleration: &acceleration andWithTimer: timer];
	[controller update];

	STAssertEquals(expectedResult, [positions getVertices][0], @"");
}
@end
