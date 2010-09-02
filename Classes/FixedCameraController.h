#import "Controller.h"
#import "Camera.h"
#import "Vector3f.h"

@interface FixedCameraController : Controller {
	Camera* camera;

}
-(id) initAtPosition: (Vector3f*) position withTarget: (Vector3f*) target andUpDirection: (Vector3f*) up;
-(void)update;
@end
