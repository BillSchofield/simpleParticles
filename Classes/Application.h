//
//  Application.h
//  Particles
//
//  Created by bschofil on 8/25/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GLView.h"
#import "OpenGLCommon.h"
#import "ParticleEmitter.h"

@interface Application : NSObject {
	ParticleEmitter* particleEmitter;
	NSMutableArray* emitterFactories;
	float timeUntilNextEmitter;	
	int currentEmitterFactoryIndex;
	Vector3D currentAcceleration;	
}
- (id) init;
- (void) update;
@end
