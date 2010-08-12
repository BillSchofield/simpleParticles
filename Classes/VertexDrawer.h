//
//  VertexDrawer.h
//  Particles
//
//  Created by bschofil on 8/11/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OpenGLCommon.h"


@interface VertexDrawer : NSObject {
}
- (void) Draw: (Vertex3D *) vertexArray colorArray: (Color3D *) colorArray numberOfVertices: (int) numberOfVertices;

@end
