//
//  Plane.h
//  Particles
//
//  Created by bschofil on 8/18/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "OpenGLCommon.h"

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
