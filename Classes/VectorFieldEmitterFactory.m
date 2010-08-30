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
#import "ParticleEmitter.h"
#import "FollowParticleCameraController.h"

@implementation VectorFieldEmitterFactory

- (id) create
{
	glLoadIdentity(); 
	gluLookAt(0, 6, 2, /* look from camera XYZ */
			  0, 0, 0, /* look at the origin */
			  0, 0, 1); /* positive Y up vector */
	
	const int numberOfParticles = 65536;
	VertexArray* particles = [[VertexArray alloc] init: numberOfParticles];
	Color3D* colors = malloc(sizeof(Color3D) * numberOfParticles);

	NSMutableArray *controllers = [[NSMutableArray alloc] init];	
	[controllers addObject: [[VectorFieldPositionController alloc] initWithVertices:particles]];	
	[controllers addObject: [[SinPositionColorController alloc] init:particles withColors:colors andScale: 1]];
	[controllers addObject: [[FollowParticleCameraController alloc] initWithPositionToFollow:[particles getVertices]]];
	
	return [[ParticleEmitter alloc] init: particles withColors:colors withControllers:controllers];
}

@end
