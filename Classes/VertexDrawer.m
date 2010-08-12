//
//  VertexDrawer.m
//  Particles
//
//  Created by bschofil on 8/11/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "VertexDrawer.h"


@implementation VertexDrawer

- (void) Draw: (Vertex3D*) vertexArray colorArray: (Color3D *) colorArray numberOfVertices: (int) numberOfVertices  
{
	glVertexPointer(3, GL_FLOAT, 0, vertexArray);
	glColorPointer(4, GL_FLOAT, 0, colorArray);
	glClearColor(0.7, 0.7, 0.7, 1.0);
	glColor4f(1.0, 0.0, 0.0, 1.0);
	glPointSize(2.0);
	glEnable(GL_BLEND);
	glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
	
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	glEnableClientState(GL_VERTEX_ARRAY);
	glEnableClientState(GL_COLOR_ARRAY);
	glDrawArrays(GL_POINTS, 0, numberOfVertices);
	glDisableClientState(GL_COLOR_ARRAY);
	glDisableClientState(GL_VERTEX_ARRAY);
	
}

@end
