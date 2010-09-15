#import "PolarCoordinateEmitterFactory.h"
#import "PolarCoordinatePositionController.h"
#import "PositionColorController.h"
#import "ParticleEmitter.h"
#import "FixedCameraController.h"
#import "GLCamera.h"
#import "ConstantColorController.h"

@implementation PolarCoordinateEmitterFactory

- (id) create
{
	Vector3f cameraPosition = {0, 2, 2};
	Vector3f cameraTarget = {0, 0, 0};
	Vector3f cameraUp = {0, 0, 1};

	const int numberOfParticles = 1024;
	VertexArray* particles = [[VertexArray alloc] init: numberOfParticles];
	Color* colors = malloc(sizeof(Color) * numberOfParticles);
	NSMutableArray *controllers = [[NSMutableArray alloc] init];
	
	[controllers addObject: [[FixedCameraController alloc] initWithCamera: [GLCamera alloc] atPosition: &cameraPosition withTarget: &cameraTarget andUpDirection: &cameraUp]];
	[controllers addObject: [[PolarCoordinatePositionController alloc] initWithVertices:particles]];
	[controllers addObject: [[PositionColorController alloc] init:particles withColors:colors andScale: 1.0]];
	
	return [[ParticleEmitter alloc] init: particles withColors:colors withControllers:controllers];
}

@end
