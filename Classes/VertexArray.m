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
	vertices = malloc(sizeof(Vector3f) * numberOfVertices);
	
	return self;
}

- (Vector3f*) getVertices
{
	return vertices;
}

- (int) getNumberOfVertices;
{
	return numberOfVertices;
}

-(void) dealloc
{
	free(vertices);
	[super dealloc];

}
@end
