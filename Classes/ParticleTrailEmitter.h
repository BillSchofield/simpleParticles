//
//  ParticleTrailEmitter.h
//  Particles
//
//  Created by bschofil on 9/12/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "Vector3f.h"
#import "Timer.h"

@interface ParticleTrailEmitter : NSObject {
	Vector3f* acceleration;
	Timer* timer;
}
- (id) initWithGravity: (Vector3f*) sourceAcceleration andWithTimer: (Timer*) sourceTimer;
- (id) create;
@end
