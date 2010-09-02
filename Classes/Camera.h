#import "Vector3f.h"

@interface Camera : NSObject {		
}
-(id) initAtPosition: (Vector3f*) position withTarget: (Vector3f*) target andUpDirection: (Vector3f*) up;
-(void) moveCameraTo: (Vector3f*) position withTarget: (Vector3f*) target andUpDirection: (Vector3f*) up;
@end
