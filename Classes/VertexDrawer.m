#import "VertexDrawer.h"
#import "OpenGLCommon.h"

@implementation VertexDrawer

- (void) Draw: (VertexArray*) vertexArray colorArray: (Color *) colorArray
{
	glVertexPointer(3, GL_FLOAT, 0, [vertexArray getVertices]);
	glColorPointer(4, GL_FLOAT, 0, colorArray);
	
	glEnableClientState(GL_VERTEX_ARRAY);
	glEnableClientState(GL_COLOR_ARRAY);
	glDrawArrays(GL_POINTS, 0, [vertexArray getNumberOfVertices]);
	glDisableClientState(GL_COLOR_ARRAY);
	glDisableClientState(GL_VERTEX_ARRAY);
	
}

@end
