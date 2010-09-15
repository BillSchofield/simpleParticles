//
//  VectorFieldEmitterFactory.m
//  Particles
//
//  Created by bschofil on 8/19/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "VectorFieldEmitterFactory.h"
#import "VertexArray.h"
#import "VectorFieldPositionController.h"
#import "SinPositionColorController.h"
#import "PositionColorController.h"
#import "ParticleEmitter.h"
#import "FollowParticleCameraController.h"
#import "FixedCameraController.h"
#import "Color.h"
#import "GLCamera.h"

@implementation VectorFieldEmitterFactory

- (void) addFixedCameraController: (NSMutableArray *) controllers  {
	Vector3f cameraPosition = {12, 12, 0};
	Vector3f cameraTarget = {3, 3, 3};
	Vector3f cameraUp = {0, 0, 1};
	[controllers addObject: [[FixedCameraController alloc] initWithCamera: [GLCamera alloc] atPosition: &cameraPosition withTarget: &cameraTarget andUpDirection: &cameraUp]];

}
- (id) create
{
	const int numberOfParticles = 16384;
	VertexArray* particles = [[VertexArray alloc] init: numberOfParticles];
	Color* colors = malloc(sizeof(Color) * numberOfParticles);

	NSMutableArray *controllers = [[NSMutableArray alloc] init];	
	[controllers addObject: [[VectorFieldPositionController alloc] initWithVertices:particles]];	
	[controllers addObject: [[SinPositionColorController alloc] init:particles withColors:colors]];
	[self addFixedCameraController: controllers];

	return [[ParticleEmitter alloc] init: particles withColors:colors withControllers:controllers];
}

@end
