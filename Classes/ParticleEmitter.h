//
//  ParticleEmitter.h
//  Particles
//
//  Created by bschofil on 8/11/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VertexDrawer.h"
#import "Controller.h"

@interface ParticleEmitter : NSObject 
{	
@private
	VertexArray* particles;
	Color3D* colors;
	NSMutableArray *controllers;	
}
- (id) init: (VertexArray *) particlesIn withColors: (Color3D *) colorsIn withControllers: (NSMutableArray *) controllersIn;  
- (void) update;
- (void) draw: (VertexDrawer*) vertexDrawer;


@end


