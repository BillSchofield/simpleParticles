#import "Vector3f.h"

@interface Plane : NSObject {
	Vector3f normalVector;
	float offset;
}
-(id) initWithNormalVector: (Vector3f) planeNormalVector andOffset: (float)planeOffset;
-(bool) isBelow: (Vector3f*) point;
-(void) movePointToPlane: (Vector3f*) point;
-(void) scaleNormalComponentOfVector: (Vector3f*) vector withScale: (float)scale;
-(void) reflectVector: (Vector3f*) vector;


@end
