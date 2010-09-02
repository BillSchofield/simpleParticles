//
//  VertexDrawer.h
//  Particles
//
//  Created by bschofil on 8/11/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OpenGLCommon.h"
#import "VertexArray.h"
#import "Color.h"

@interface VertexDrawer : NSObject {
}
- (void) Draw: (VertexArray *) vertexArray colorArray: (Color *) colorArray;

@end
