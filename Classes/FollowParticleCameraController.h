#import "Controller.h"
#import "Camera.h"
#import "Vector3f.h"

@interface FollowParticleCameraController : Controller {
	Vector3f* position;
	id<Camera> camera;
}
-(id)initWithCamera: (id<Camera>) sourceCamera andPositionToFollow: (Vector3f*)sourceVector;

@end
