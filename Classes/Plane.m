//
//  Plane.m
//  Particles
//
//  Created by bschofil on 8/18/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "Plane.h"


@implementation Plane

-(id) initWithNormalVector: (Vector3D) planeNormalVector andOffset: (float)planeOffset
{
	normalVector = planeNormalVector;
	offset = planeOffset;
	
	return self;

}

-(bool) isBelow: (Vertex3D*) vertex
{
	float dotProduct = Vector3DDotProduct(*vertex, normalVector);
	return dotProduct < offset;
}

@end
