#import "FixedCameraController.h"


@implementation FixedCameraController
-(id) initAtPosition: (Vector3D*) position withTarget: (Vector3D*) target andUpDirection: (Vector3D*) up {

	camera = [[ Camera alloc ] initAtPosition:position withTarget:target andUpDirection:up ];
	return self;
}
-(void)update {
}
@end
