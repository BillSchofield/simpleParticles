#import "PolarCoordinateEmitterFactory.h"
#import "PolarCoordinatePositionController.h"
#import "PositionColorController.h"
#import "ParticleEmitter.h"
#import "FixedCameraController.h"


@implementation PolarCoordinateEmitterFactory

- (id) create
{
	Vector3f cameraPosition = {0, 2, 2};
	Vector3f cameraTarget = {0, 0, 0};
	Vector3f cameraUp = {0, 0, 1};

	const int numberOfParticles = 1024;
	VertexArray* particles = [[VertexArray alloc] init: numberOfParticles];
	Color3D* colors = malloc(sizeof(Color3D) * numberOfParticles);
	NSMutableArray *controllers = [[NSMutableArray alloc] init];
	
	[controllers addObject: [[FixedCameraController alloc] initAtPosition: &cameraPosition withTarget: &cameraTarget andUpDirection: &cameraUp]];
	[controllers addObject: [[PolarCoordinatePositionController alloc] initWithVertices:particles]];
	[controllers addObject: [[PositionColorController alloc] init:particles withColors:colors andScale: 1.0]];
	
	return [[ParticleEmitter alloc] init: particles withColors:colors withControllers:controllers];
}

@end
