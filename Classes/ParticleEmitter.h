//
//  ParticleEmitter.h
//  Particles
//
//  Created by bschofil on 8/11/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PolarCoordinatePositionController.h"
#import "GravityPositionController.h"
#import "PositionColorController.h"


@interface ParticleEmitter : NSObject {

	
	
}

Vertex3D* particles;
Color3D* colors;
NSMutableArray *controllers;

@end


