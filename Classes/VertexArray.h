//
//  VertexArray.h
//  Particles
//
//  Created by bschofil on 8/12/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OpenGLCommon.h"

@interface VertexArray : NSObject {
	Vertex3D* vertices;
	int numberOfVertices;
}
- (id) init: (int) size;
- (Vertex3D*) getVertices;
- (int) getNumberOfVertices;

@end
