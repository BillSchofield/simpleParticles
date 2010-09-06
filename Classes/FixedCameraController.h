#import "Controller.h"
#import "Camera.h"
#import "Vector3f.h"

@interface FixedCameraController : Controller {
	id<Camera> camera;

}
-(id) initWithCamera: (id<Camera>) sourceCamera atPosition: (Vector3f*) position withTarget: (Vector3f*) target andUpDirection: (Vector3f*) up;
-(void)update;
@end
