#import "FixedCameraController.h"


@implementation FixedCameraController
-(id) initWithCamera: (id<Camera>) sourceCamera atPosition: (Vector3f*) position withTarget: (Vector3f*) target andUpDirection: (Vector3f*) up {

	camera = [sourceCamera initAtPosition:position withTarget:target andUpDirection:up ];
	return self;
}
-(void)update {
}
@end
