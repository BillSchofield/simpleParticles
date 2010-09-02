#import "FixedCameraController.h"


@implementation FixedCameraController
-(id) initAtPosition: (Vector3f*) position withTarget: (Vector3f*) target andUpDirection: (Vector3f*) up {

	camera = [[ Camera alloc ] initAtPosition:position withTarget:target andUpDirection:up ];
	return self;
}
-(void)update {
}
@end
