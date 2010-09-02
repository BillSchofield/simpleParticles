#import "Controller.h"
#import "OpenGLCommon.h"
#import "Camera.h"

@interface FixedCameraController : Controller {
	Camera* camera;

}
-(id) initAtPosition: (Vector3D*) position withTarget: (Vector3D*) target andUpDirection: (Vector3D*) up;
-(void)update;
@end
