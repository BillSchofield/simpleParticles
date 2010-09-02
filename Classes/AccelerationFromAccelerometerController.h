#import "Controller.h"
#import "Vector3f.h"

@interface AccelerationFromAccelerometerController : Controller< UIAccelerometerDelegate > {
	Vector3f* acceleration;
	UIAccelerometer *accelerometer;
}

@property (nonatomic, retain) UIAccelerometer *accelerometer;

-(id)initWithAcceleration: (Vector3f*)accelerationToControl;
-(void) update;
- (void)dealloc;
- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration;
	
@end
