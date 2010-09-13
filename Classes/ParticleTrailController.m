//
//  ParticleTrailController.m
//  Particles
//
//  Created by bschofil on 9/12/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "ParticleTrailController.h"
#import "Vector3f.h"

@implementation ParticleTrailController
-(id) initWithParticles: (VertexArray*) sourceParticles {
	particles = sourceParticles;
	for (int i=0; i<7; ++i) {
		trails[i] = [VertexArray alloc];
	}
	return self;
}

-(void)drawTrails{
}

-(void)copyVertexArrayFrom: (VertexArray*) source to:(VertexArray*) destination {
}

-(void)updateTrails{
	[self copyVertexArrayFrom:particles to: trails[0]];
}

-(void)update {
	[self drawTrails];
	[self updateTrails];
}

-(void)dealloc {
	for (int i=0; i<7; ++i) {
		[trails[i] release];
	}
	[super dealloc];
}
@end
