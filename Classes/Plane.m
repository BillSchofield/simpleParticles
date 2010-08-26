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

-(bool) isBelowPlane: (Vertex3D*) point
{
	float dotProduct = Vector3DDotProduct(*point, normalVector);
	return dotProduct < offset;
}

-(void) movePointToPlane: (Vertex3D*) point
{
	float amountPastPlane = Vector3DDotProduct(*point, normalVector);
	amountPastPlane -= offset;
	Vector3DScaleAndAccumulate(point, -amountPastPlane, &normalVector);
}
-(void) scaleNormalComponentOfVector: (Vertex3D*) vector withScale: (float)scale {
	Vector3DScaleAndAccumulate(vector, -scale * Vector3DDotProduct(*vector, normalVector), &normalVector);
}

-(void) reflectVector: (Vertex3D*) vector {
	float amountPastPlane = Vector3DDotProduct(*vector, normalVector);
	Vector3DScaleAndAccumulate(vector, -2 * amountPastPlane, &normalVector);
}
@end
