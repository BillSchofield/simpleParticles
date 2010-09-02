#import "Controller.h"
#import "Camera.h"
#import "Vector3f.h"

@interface FollowParticleCameraController : Controller {
	Vector3f* position;
	Camera* camera;
}
-(id)initWithPositionToFollow: (Vector3f*)sourceVector; 

@end
