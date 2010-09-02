#import "FollowParticleCameraController.h"

static Vector3f up = {0, 0, 1};
static Vector3f origin = {0, 0, 0};

@implementation FollowParticleCameraController
-(id)initWithPositionToFollow: (Vector3f*)sourceVector {
	position = sourceVector;
	camera = [[Camera alloc] initAtPosition:position withTarget:position andUpDirection: &up];
	return self;
}

-(void) update {
	[camera moveCameraTo: position withTarget: &origin andUpDirection: &up];
}
@end
