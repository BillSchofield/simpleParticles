#import <Foundation/Foundation.h>
#import "VertexDrawer.h"
#import "Controller.h"
#import "Color.h"

@interface ParticleEmitter : NSObject 
{	
@private
	VertexArray* particles;
	Color*	colors;
	NSMutableArray *controllers;	
}
- (id) init: (VertexArray *) particlesIn withColors: (Color*) colorsIn withControllers: (NSMutableArray *) controllersIn;  
- (void) update;
- (void) draw: (VertexDrawer*) vertexDrawer;


@end


