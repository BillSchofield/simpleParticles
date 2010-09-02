#import "Camera.h"


@implementation Camera

-(id) initAtPosition: (Vector3f*) position withTarget: (Vector3f*) target andUpDirection: (Vector3f*) up {
	[self moveCameraTo: position withTarget: target andUpDirection: up];
	return self;
}

-(void) moveCameraTo: (Vector3f*) position withTarget: (Vector3f*) target andUpDirection: (Vector3f*) up {
	glLoadIdentity(); 
	gluLookAt(position->x, position->y, position->z,
			  target->x, target->y, target->z,
			  up->x, up->y, up->z);	
}
@end
