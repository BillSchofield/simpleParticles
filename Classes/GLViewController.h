//
//  GLViewController.h
//  Particles
//
//  Created by bschofil on 8/6/10.
//  Copyright ThoughtWorks 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GLView.h"
#import "OpenGLCommon.h"
#import "PolarCoordinatePositionController.h"
#import "GravityPositionController.h"
#import "PositionColorController.h"

@interface GLViewController : UIViewController <GLViewDelegate>
{
}
const int numberOfParticles = 1024;
Vertex3D* particles;
Color3D* colors;
PositionColorController* colorController;
PolarCoordinatePositionController* polarCoordinatesPositionController;
GravityPositionController* gravityPositionController;

@end
