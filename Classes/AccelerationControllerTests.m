//
//  AccelerationControllerTests.m
//  Particles
//
//  Created by bschofil on 9/4/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "AccelerationControllerTests.h"

@implementation AccelerationControllerTests
- (void) initPositionsWith: (Vector3f) initialValue numberOfParticles: (int) numberOfParticles  {
	initialPosition = initialValue;
	positions = [[VertexArray alloc] init: numberOfParticles];
	Vector3fCopy(&[positions getVertices][0], &initialPosition);	
	Vector3fCopy(&[positions getVertices][1], &initialPosition);
}

- (void) initVelocitiesWith: (Vector3f) initialValue numberOfParticles: (int) numberOfParticles  {
	velocities = malloc(sizeof(Vector3f) * numberOfParticles);
	Vector3fCopy(&velocities[0], &initialValue);
	Vector3fCopy(&velocities[1], &initialValue);

}

- (void) setUp
{
	int numberOfParticles = 2;
	initialPosition = Vector3fMake(1, 1, 1);
	[self initPositionsWith: initialPosition numberOfParticles: numberOfParticles];
	
	initialVelocity = Vector3fMake(1, 2, 3);
	[self initVelocitiesWith: initialVelocity numberOfParticles: numberOfParticles];

	acceleration = Vector3fOrigin();
	
	timer = [[FakeTimer alloc] init];
	
	controller = [[AccelerationController alloc ] initWithVertices: positions withVelocities: velocities withAcceleration: &acceleration andWithTimer: timer];
}

- (void) tearDown
{
	free(velocities);
	[positions release];
}

- (void) testGivenSomeVelocityAndNoAccelerationWhenNoTimePassesThenPositionIsUnchanged {
	[timer timeUpdateInterval: 0.0];
	
	[controller update];
	
	STAssertEquals(initialPosition, [positions getVertices][0], @"");
}

- (void) testGivenSomeVelocityAndNoAccelerationWhenOneSecondPassesThenPositionIncreasesByOneTimesVelocity {
	[timer timeUpdateInterval: 1.0];
	
	[controller update];

	STAssertEquals(Vector3fAdd(initialPosition, initialVelocity), [positions getVertices][0], @"");
}

- (void) testGivenSomeAccelerationWhenNoTimePassesThenVelocityIsUnchanged {
	[timer timeUpdateInterval: 0.0];
	Vector3fSet(&acceleration, 5, 6, 7);
	
	[controller update];
	
	STAssertEquals(initialVelocity, velocities[0], @"");
}

- (void) testGivenSomeAccelerationWhenOneSecondPassesThenVelocityIncreasesByOneTimesAcceleration {
	[timer timeUpdateInterval: 1.0];
	Vector3fSet(&acceleration, 5, 6, 7);
	
	[controller update];
	
	STAssertEquals(Vector3fAdd(initialVelocity, acceleration), velocities[0], @"");
}

- (void) testGivenSomeAccelerationWhenOneSecondPassesThenPositionIncreasesByOneTimesAcceleration {
	[timer timeUpdateInterval: 1.0];
	Vector3fSet(velocities, 0, 0, 0);
	Vector3fSet(&acceleration, 5, 6, 7);
	
	[controller update];
	
	STAssertEquals(Vector3fAdd(initialPosition, acceleration), [positions getVertices][0], @"");
}

- (void) testGivenTwoVelocitiesWhenOneSecondPassesThenSecondPositionHasAccelerationAndVelocityApplied {
	[timer timeUpdateInterval: 1.0];
	Vector3fSet(&velocities[1], 1, 3, 5);
	Vector3fSet(&acceleration, 1, 4, 7);
	
	[controller update];
	
	Vector3f expectedValue = Vector3fMake(3, 8, 13);
	STAssertEquals(expectedValue, [positions getVertices][1], @"");
}


@end
