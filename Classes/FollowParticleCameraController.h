//
//  FollowParticleCameraController.h
//  Particles
//
//  Created by bschofil on 8/28/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "Controller.h"
#import "OpenGLCommon.h"

@interface FollowParticleCameraController : Controller {
	Vector3D* position;
	Vector3D oldPosition;
}
-(id)initWithPositionToFollow: (Vector3D*)sourceVector; 

@end
