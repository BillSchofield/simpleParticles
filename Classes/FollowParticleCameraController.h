#import "Controller.h"
#import "Camera.h"
#import "Vector3f.h"

@interface FollowParticleCameraController : Controller {
	Vector3f* position;
	Vector3f* target;
	id<Camera> camera;
}
-(id)initWithCamera: (id<Camera>) sourceCamera withPositionToFollow: (Vector3f*)sourceVector andTarget: (Vector3f*)sourceTarget;

@end
