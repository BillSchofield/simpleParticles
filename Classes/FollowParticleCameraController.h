//
//  FollowParticleCameraController.h
//  Particles
//
//  Created by bschofil on 8/28/10.
//  Copyright 2010 ThoughtWorks. All rights reserved.
//

#import "Controller.h"
#import "OpenGLCommon.h"
#import "Camera.h"

@interface FollowParticleCameraController : Controller {
	Vector3f* position;
	Camera* camera;
}
-(id)initWithPositionToFollow: (Vector3f*)sourceVector; 

@end
