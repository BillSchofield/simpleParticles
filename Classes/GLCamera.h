#import "Camera.h"

@interface GLCamera : NSObject<Camera> {		
}
-(id) initAtPosition: (Vector3f*) position withTarget: (Vector3f*) target andUpDirection: (Vector3f*) up;
-(void) moveCameraTo: (Vector3f*) position withTarget: (Vector3f*) target andUpDirection: (Vector3f*) up;
@end
