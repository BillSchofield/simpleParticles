#import "FollowParticleCameraController.h"


@implementation FollowParticleCameraController
-(id)initWithPositionToFollow: (Vector3D*)sourceVector {
	position = sourceVector;
	oldPosition = *position;
	return self;
}

-(void) update {
	glLoadIdentity();
	Vector3D directionToAimCamera = Vector3DMakeWithStartAndEndPoints(oldPosition, *position);
	oldPosition = *position;
	gluLookAt(position->x, position->y, position->z,
			  directionToAimCamera.x, directionToAimCamera.y, directionToAimCamera.z, 
			  0, 0, 1);
	
}
@end
