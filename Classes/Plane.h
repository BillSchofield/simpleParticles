//
//  Plane.h
//  Particles
//
//  Created by bschofil on 8/18/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "OpenGLCommon.h"

@interface Plane : NSObject {
	Vector3D normalVector;
	float offset;
}
-(id) initWithNormalVector: (Vector3D) planeNormalVector andOffset: (float)planeOffset;
-(bool) isBelowPlane: (Vertex3D*) point;
-(void) movePointToPlane: (Vertex3D*) point;
-(void) reflectVector: (Vertex3D*) vector;


@end
