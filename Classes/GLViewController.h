//
//  GLViewController.h
//  Particles
//
//  Created by bschofil on 8/6/10.
//  Copyright ThoughtWorks 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GLView.h"
#import "OpenGLCommon.h"
#import "ParticleEmitter.h"

@interface GLViewController : UIViewController < GLViewDelegate >
{
	ParticleEmitter* particleEmitter;
	NSMutableArray* emitterFactories;
	int currentEmitterFactoryIndex;
	Vector3D currentAcceleration;
}

@end
