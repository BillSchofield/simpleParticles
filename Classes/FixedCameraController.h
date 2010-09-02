#import "Controller.h"
#import "OpenGLCommon.h"
#import "Camera.h"

@interface FixedCameraController : Controller {
	Camera* camera;

}
-(id) initAtPosition: (Vector3f*) position withTarget: (Vector3f*) target andUpDirection: (Vector3f*) up;
-(void)update;
@end
