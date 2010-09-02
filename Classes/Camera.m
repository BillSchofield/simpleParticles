#import "Camera.h"


@implementation Camera

-(id) initAtPosition: (Vector3D*) position withTarget: (Vector3D*) target andUpDirection: (Vector3D*) up {
	[self moveCameraTo: position withTarget: target andUpDirection: up];
	return self;
}

-(void) moveCameraTo: (Vector3D*) position withTarget: (Vector3D*) target andUpDirection: (Vector3D*) up {
	glLoadIdentity(); 
	gluLookAt(position->x, position->y, position->z,
			  target->x, target->y, target->z,
			  up->x, up->y, up->z);	
}
@end
