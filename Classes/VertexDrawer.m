//
//  VertexDrawer.m
//  Particles
//
//  Created by bschofil on 8/11/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "VertexDrawer.h"


@implementation VertexDrawer

- (void) Draw: (VertexArray*) vertexArray colorArray: (Color3D *) colorArray
{
	glVertexPointer(3, GL_FLOAT, 0, [vertexArray getVertices]);
	glColorPointer(4, GL_FLOAT, 0, colorArray);
	glColor4f(1.0, 0.0, 0.0, 1.0);
	glPointSize(2.0);
	glEnable(GL_BLEND);
	glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
	
	glEnableClientState(GL_VERTEX_ARRAY);
	glEnableClientState(GL_COLOR_ARRAY);
	glDrawArrays(GL_POINTS, 0, [vertexArray getNumberOfVertices]);
	glDisableClientState(GL_COLOR_ARRAY);
	glDisableClientState(GL_VERTEX_ARRAY);
	
}

@end
