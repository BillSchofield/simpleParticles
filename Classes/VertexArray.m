//
//  VertexArray.m
//  Particles
//
//  Created by bschofil on 8/12/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "VertexArray.h"


@implementation VertexArray
- (id) init: (int) size
{
	numberOfVertices = size;
	vertices = malloc(sizeof(Vertex3D) * numberOfVertices);
	
	return self;
}

- (Vertex3D*) getVertices
{
	return vertices;
}

- (int) getNumberOfVertices;
{
	return numberOfVertices;
}

@end
