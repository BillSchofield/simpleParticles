//
//  ParticleTrailController.h
//  Particles
//
//  Created by bschofil on 9/12/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "Controller.h"
#import "VertexArray.h"

@interface ParticleTrailController : Controller {
	VertexArray* particles;
	VertexArray* trails[7];
}
-(id) initWithParticles: (VertexArray*) sourceParticles;

@end
