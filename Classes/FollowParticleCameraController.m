#import "FollowParticleCameraController.h"

static Vector3f up = {0, 0, 1};

@implementation FollowParticleCameraController
-(id)initWithCamera: (id<Camera>) sourceCamera withPositionToFollow: (Vector3f*)sourceVector andTarget: (Vector3f*)sourceTarget{
	position = sourceVector;
	target = sourceTarget;
	camera = [sourceCamera initAtPosition:position withTarget:position andUpDirection: &up];
	return self;
}

-(void) update {
	[camera moveCameraTo: position withTarget: target andUpDirection: &up];
}
@end
