#import "Plane.h"

@implementation Plane

-(id) initWithNormalVector: (Vector3f) planeNormalVector andOffset: (float)planeOffset
{
	normalVector = planeNormalVector;
	offset = planeOffset;
	
	return self;

}

-(bool) isBelow: (Vector3f*) point
{
	float dotProduct = Vector3fDotProduct(*point, normalVector);
	return dotProduct < offset;
}

-(void) movePointToPlane: (Vector3f*) point
{
	float amountPastPlane = Vector3fDotProduct(*point, normalVector);
	amountPastPlane -= offset;
	Vector3fScaleAndAccumulate(point, -amountPastPlane, &normalVector);
}
-(void) scaleNormalComponentOfVector: (Vector3f*) vector withScale: (float)scale {
	Vector3fScaleAndAccumulate(vector, -scale * Vector3fDotProduct(*vector, normalVector), &normalVector);
}

-(void) reflectVector: (Vector3f*) vector {
	float amountPastPlane = Vector3fDotProduct(*vector, normalVector);
	Vector3fScaleAndAccumulate(vector, -2 * amountPastPlane, &normalVector);
}
@end
