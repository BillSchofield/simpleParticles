#import "OpenGLCommon.h"


@interface Camera : NSObject {		
}
-(id) initAtPosition: (Vector3D*) position withTarget: (Vector3D*) target andUpDirection: (Vector3D*) up;
-(void) moveCameraTo: (Vector3D*) position withTarget: (Vector3D*) target andUpDirection: (Vector3D*) up;
@end
