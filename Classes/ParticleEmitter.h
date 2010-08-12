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
#import "VertexDrawer.h"


@interface ParticleEmitter : NSObject 
{	
@private
	Vertex3D* particles;
	Color3D* colors;
	NSMutableArray *controllers;	
}
-(void)update;
-(void)draw: (VertexDrawer*) vertexDrawer;


@end


